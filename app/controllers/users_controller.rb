# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user_books = @user.user_books
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
