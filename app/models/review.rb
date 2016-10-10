# frozen_string_literal: true
class Review < ActiveRecord::Base
  belongs_to :user, counter_cache: :reviews_count
  belongs_to :book, counter_cache: :reviews_count

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :comment, presence: true

  # レビューを登録
  # @param [User] ユーザーオブジェクト
  # @param [String] コメント
  # @return [Boolean] 登録結果
  def register(user, comment)
    self.user_id = user.id
    self.comment = comment
    save
  end

  # 本に紐づくレビューを取得
  # @param [Book] Bookオブジェクト
  # @return [Array] Reviewの配列
  def self.get_reviews(book)
    Review.where(book_id: book.id)
  end
end
