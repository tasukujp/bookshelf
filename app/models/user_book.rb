# frozen_string_literal: true
class UserBook < ActiveRecord::Base
  belongs_to :user, counter_cache: :books_count
  belongs_to :book, counter_cache: :users_count

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rental_date, presence: true
  validates :due_date, presence: true

  def self.get_user_books_history(user)
    UserBook.find_by_user_id(user.id)
  end

  # 本の貸出情報を登録
  # @param [User] ログインユーザー
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
