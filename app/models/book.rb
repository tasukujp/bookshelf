# frozen_string_literal: true
class Book < ActiveRecord::Base
  has_many :user_books, dependent: :delete_all
  has_many :users, through: :user_books

  validates :isbn, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: true, length: { maximum: 64 }
  validates :author, length: { maximum: 32 }
  validates :publisher, length: { maximum: 16 }
  validates :url, url_format: true
  validates :image, url_format: true

  def rental(user)
    user_book = user_books.build do |t|
      t.user_id = user.id
      t.rental_date = Time.current
      t.due_date = Time.current
    end
    user_book.save!
  end

  def rental?
    user_books.find { |v| v.return_date.nil? } ? true : false
  end
end
