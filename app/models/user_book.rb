# frozen_string_literal: true
class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
end
