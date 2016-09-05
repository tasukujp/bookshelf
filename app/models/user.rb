# frozen_string_literal: true
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :user_books
  has_many :books, through: :user_books

  attr_accessor :login

  validates :name, presence: true, uniqueness: { allow_blank: true },
                  length: { minimum: 6, maximum: 255, allow_blank: true }

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(['lower(name) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:name) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end
end
