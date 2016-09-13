# frozen_string_literal: true
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
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
      redirect_to root_url, notice: '新しく本を登録しました。'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publisher, :published, :url, :image)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
