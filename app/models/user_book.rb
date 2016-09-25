# frozen_string_literal: true
class UserBook < ActiveRecord::Base
  belongs_to :user, counter_cache: :books_count
  belongs_to :book, counter_cache: :users_count

  default_scope { order(rental_date: :desc) }

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rental_date, presence: true
  validates :due_date, presence: true

  # 本の貸出履歴を取得
  # @param [User] ユーザーオブジェクト
  # @return [Array] UserBookとBookの配列
  def self.get_rental_history(user)
    UserBook.where(user_id: user.id).joins(:book).select('user_books.*, books.*')
  end

  # 貸出中の本を取得
  # @param [User] ユーザーオブジェクト
  # @return [Array] Bookオブジェクトの配列
  def self.get_rental_books(user)
    user.user_books.where(return_date: nil).map { |t| Book.find(t.book_id) }
  end

  # 本の貸出情報を登録
  # @param [User] ユーザーオブジェクト
  # @return [Boolean] 登録結果
  def register(user)
    self.user_id = user.id
    self.rental_date = Time.current
    self.due_date = Time.current
    self.save
  end

  # 本の返却処理
  def return
    self.return_date = Time.current
    self.save!
  end
end
