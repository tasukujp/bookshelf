# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users_search = UsersSearch.new(params[:users_search])
    @users = @users_search.search.paginate(page: params[:page], per_page: 10)
    flash.now[:alert] = t('users.index.empty') unless @users.exists?
  end

  # GET /users/:id
  def show
    @user_books = UserBook.get_rental_history(@user).paginate(page: params[:page], per_page: 5)
    @rental_books = UserBook.get_rental_books(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
