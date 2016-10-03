class BooksSearch < ApplicationSearch
  attr_accessor :isbn, :title, :author, :publisher, :published

  def search
    results = Book.all
    results = results.where('isbn = ?', isbn) if isbn.present?
    results = results.where('title LIKE ?', "%#{title}%") if title.present?
    results = results.where('author LIKE ?', "%#{author}%") if author.present?
    results = results.where('publisher LIKE ?', "%#{publisher}%") if publisher.present?
    results = results.where('published >= ?', published) if published.present?
    results
  end
end