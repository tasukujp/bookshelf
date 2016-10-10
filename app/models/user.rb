# frozen_string_literal: true
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :user_books, dependent: :delete_all
  has_many :books, through: :user_books

  has_many :reviews, dependent: :delete_all
  has_many :review_books, through: :reviews, source: :book

  attr_accessor :login

  validates :name, presence: true, uniqueness: { allow_blank: true },
                   length: { minimum: 4, maximum: 16, allow_blank: true }

  mount_uploader :user_image, UserImageUploader

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).find_by(['lower(name) = :value OR lower(email) = :value', { value: login.downcase }])
    elsif conditions.key?(:name) || conditions.key?(:email)
      find_by(conditions.to_h)
    end
  end
end
