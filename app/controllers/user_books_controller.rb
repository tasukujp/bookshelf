# frozen_string_literal: true
class UserBooksController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    respond_to do |format|
      if @book.user_books.build.register(current_user)
        format.html { redirect_to @book, notice: '本の貸出処理が完了しました。' }
      else
        format.html { redirect_to @book, alert: '本の貸出が出来ませんでした。' }
      end
    end
  end

  def update
    user_book = UserBook.find(params[:id])
    user_book.return
    respond_to do |format|
      format.html { redirect_to root_path, notice: '本の返却処理が完了しました。' }
    end
  end
end
