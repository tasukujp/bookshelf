# frozen_string_literal: true
class UserBook < ActiveRecord::Base
  belongs_to :user, counter_cache: :books_count
  belongs_to :book, counter_cache: :users_count

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rental_date, presence: true
  validates :due_date, presence: true

  def return
    self.return_date = Time.current
    self.save!
  end
end
