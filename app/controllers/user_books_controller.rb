# frozen_string_literal: true
class UserBooksController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book.rental(current_user)
    respond_to do |format|
      format.html { redirect_to root_path, notice: '新しく本を借りました。' }
    end
  end

  def update
    user_book = UserBook.find(params[:id])
    user_book.return
    respond_to do |format|
      format.html { redirect_to root_path, notice: '本を返却しました。' }
    end
  end
end
