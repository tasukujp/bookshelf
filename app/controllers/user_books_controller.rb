# frozen_string_literal: true
class UserBooksController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @book.rental(current_user)
    respond_to do |format|
      format.html { redirect_to root_path, notice: '新しく本を借りました。' }
    end
  end

  def destroy
  end
end
