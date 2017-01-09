# frozen_string_literal: true
class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build
    respond_to do |format|
      if @review.register(current_user, review_params[:comment])
        flash[:notice] = t('reviews.notice.create')
        format.js { render js: "window.location = '#{book_url(@book)}'" }
      else
        format.js { render 'review' }
      end
    end
  end

  def update
    @book = Book.find(@review.book_id)
    respond_to do |format|
      if @review.update(review_params)
        flash[:notice] = t('reviews.notice.update')
        format.js { render js: "window.location = '#{book_url(@book)}'" }
        # format.json { render :show, status: :ok, location: @review }
      else
        format.js { render 'review' }
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(@review.book_id)
    @review.destroy
    respond_to do |format|
      flash[:notice] = t('reviews.notice.destroy')
      format.js { render js: "window.location = '#{book_url(@book)}'" }
      # format.json { head :no_content }
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
