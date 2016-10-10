# frozen_string_literal: true
class Review < ActiveRecord::Base
  belongs_to :user, counter_cache: :reviews_count
  belongs_to :book, counter_cache: :reviews_count

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :comment, presence: true
end
