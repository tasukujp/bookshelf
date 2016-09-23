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

  # 画像URLが登録されていない場合はデフォルト画像を返す
  # @return [String] 画像URL or デフォルト画像
  def get_image
    self.image.present? ? self.image : 'default_book.png'
  end

  # 本が貸出中か?
  # @return [Boolean]
  def rental?
    self.user_books.find { |v| v.return_date.nil? } ? true : false
  end
end
