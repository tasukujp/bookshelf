# frozen_string_literal: true
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books_search = BooksSearch.new(params[:books_search])
    @books = @books_search.search.paginate(page: params[:page], per_page: 10)
    flash.now[:alert] = t('books.alert.index') unless @books.exists?
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_url, notice: t('books.notice.create')
    else
      render 'new'
    end
  end

  def show
    @review = @book.reviews.find_by(user_id: current_user.id) || @book.reviews.build
    @reviews = Review.get_reviews(@book).paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('books.notice.update')
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to root_path, notice: t('books.notice.destroy', title: @book.title)
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :published, :url, :image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
