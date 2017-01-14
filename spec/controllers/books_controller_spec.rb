require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:valid_attributes) { attributes_for(:book) }
  let(:invalid_attributes) { attributes_for(:invalid_book) }

  before do
    login_user(user)
  end

  describe 'GET #index' do
    let(:books) { create_list(:book, 3) }
    let(:books_search) { BooksSearch.new }
    let(:search_params) { nil }

    context 'with assign all books' do
      before do
        allow(BooksSearch).to receive(:new).with(search_params).and_return(books_search)
        get :index, books_search: search_params, page: 1
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :index }
      it { expect(assigns(:books)).to match_array books }
    end

    context 'with no assign books' do
      before do
        allow(Book).to receive(:all).and_return(Book.none)
        get :index, books_search: search_params, page: 1
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :index }
      it { expect(flash.now[:alert]).to eq t('books.alert.index') }
    end
  end

  describe 'GET #show' do
    context 'with exists book' do
      before do
        get :show, id: book
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :show }
      it { expect(assigns(:book)).to eq book }
    end

    context 'with not exists book' do
      it { expect { get :show, id: 0 }.to raise_exception(ActiveRecord::RecordNotFound) }
    end
  end

  describe 'GET #new' do
    context 'with new book model' do
      before do
        get :new
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :new }
      it { expect(assigns(:book)).to be_a_new(Book) }
    end
  end

  describe 'GET #edit' do
    context 'with edit book model' do
      before do
        get :edit, id: book
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :edit }
      it { expect(assigns(:book)).to eq book }
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject { proc { post :create, book: valid_attributes } }
      it { subject.call; expect(response).to have_http_status :redirect }
      it { subject.call; expect(response).to redirect_to root_url }
      it { subject.call; expect(flash[:notice]).to eq t('books.notice.create') }
      it { expect { subject.call }.to change(Book, :count).by(1) }
    end

    context 'with invalid params' do
      subject { proc { post :create, book: invalid_attributes } }
      it { subject.call; expect(response).to have_http_status :success }
      it { subject.call; expect(response).to render_template :new }
      it { expect { subject.call }.not_to change(Book, :count) }
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before do
        patch :update, id: book, book: valid_attributes
      end

      it { is_expected.to respond_with :redirect }
      it { is_expected.to redirect_to book_url(book) }
      it { expect(flash[:notice]).to eq t('books.notice.update') }
    end

    context 'with invalid params' do
      before do
        patch :update, id: book, book: invalid_attributes
      end

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    context 'with destroy book' do
      before do
        delete :destroy, id: book
      end

      it { is_expected.to respond_with :redirect }
      it { is_expected.to redirect_to root_url }
      it { expect(flash[:notice]).to eq t('books.notice.destroy', title: book.title) }
    end
  end
end
