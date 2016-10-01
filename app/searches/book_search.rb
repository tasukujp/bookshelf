class BookSearch < ApplicationSearch
  attr_accessor :isbn, :title, :author, :publisher

  def search
    results = Book.all
    results = Book.where('title LIKE ?', "%#{title}%") if title.present?
    results
  end
end