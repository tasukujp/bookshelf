# frozen_string_literal: true
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.paginate(page: params[:page], per_page: 10)
    @rental_books = current_user.user_books.where(return_date: nil).map do |t|
      Book.find(t.book_id)
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_url, notice: t('books.new.message.notice')
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t('books.edit.message.notice')
    else
      render 'edit'
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to root_path, notice: t('books.destroy.message.notice', title: @book.title)
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :published, :url, :image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
