# frozen_string_literal: true
class Book < ActiveRecord::Base
  has_many :user_books, dependent: :delete_all
  has_many :users, through: :user_books

  validates :isbn, presence: true, uniqueness: true, isbn_format: true
  validates :title, presence: true, length: { maximum: 64 }
  validates :author, length: { maximum: 32 }
  validates :publisher, length: { maximum: 16 }
  validates :url, url_format: { ssl_only: false }
  validates :image, url_format: { ssl_only: false }

  # 本が貸出中か?
  # @param [User] ユーザーオブジェクト
  # @return [Boolean]
  def rental?(user = nil)
    user_books.find { |v|
      (user.nil? || v.user_id == user.id) && v.return_date.nil?
    } ? true : false
  end
end
