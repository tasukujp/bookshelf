# frozen_string_literal: true
# 本の貸出記録の保持テーブル
class UserBook < ActiveRecord::Base
  belongs_to :user, counter_cache: :books_count
  belongs_to :book, counter_cache: :users_count

  default_scope { order(rental_date: :desc) }

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rental_date, presence: true
  validates :due_date, presence: true

  class << self
    # 本の貸出履歴を取得
    # @param [User] ユーザーオブジェクト
    # @return [Array] UserBookとBookの配列
    def get_rental_history(user)
      UserBook.where(user_id: user.id)
    end
  end

  # 本の貸出情報を登録
  # 返却期限は7日後の23:59:59を設定
  # @param [User] ユーザーオブジェクト
  # @return [Boolean] 登録結果
  def register(user)
    self.user_id = user.id
    self.rental_date = Time.current
    self.due_date = rental_date.since(7.days).end_of_day
    save
  end

  # 本の返却処理
  def return
    self.return_date = Time.current
    save!
  end
end
