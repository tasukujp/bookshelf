# frozen_string_literal: true
class Book < ActiveRecord::Base
  has_many :user_books, dependent: :delete_all
  has_many :users, through: :user_books

  validates :isbn, presence: true
end
