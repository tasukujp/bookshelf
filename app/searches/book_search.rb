class BookSearch < ApplicationSearch
  attr_accessor :isbn, :title, :author, :publisher, :published

  def search
    results = Book.all
    results = Book.where('isbn = ?', isbn) if isbn.present?
    results = Book.where('title LIKE ?', "%#{title}%") if title.present?
    results = Book.where('author LIKE ?', "%#{author}%") if author.present?
    results = Book.where('publisher LIKE ?', "%#{publisher}%") if publisher.present?
    results = Book.where('published >= ?', published) if published.present?
    results
  end
end