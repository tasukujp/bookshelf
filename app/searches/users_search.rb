class UsersSearch < ApplicationSearch
  attr_accessor :name, :email

  def search
    results = User.all
    results = results.where('name LIKE ?', "%#{name}%") if name.present?
    results = results.where('email LIKE ?', "%#{email}%") if email.present?
    results
  end
end