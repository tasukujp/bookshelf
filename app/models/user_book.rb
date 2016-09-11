# frozen_string_literal: true
class UserBook < ActiveRecord::Base
  belongs_to :user, counter_cache: :books_count
  belongs_to :book, counter_cache: :users_count
end
