# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user_books = UserBook.get_rental_history(@user)
    @rental_books = current_user.user_books.where(return_date: nil).map do |t|
      Book.find(t.book_id)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
