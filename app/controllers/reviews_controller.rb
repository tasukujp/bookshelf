# frozen_string_literal: true
class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def edit
  end

  def create
    @book = Book.find(params[:book_id])
    respond_to do |format|
      if @book.reviews.build.register(current_user, review_params[:comment])
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
        #format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        #format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        #format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        #format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      #format.json { head :no_content }
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
