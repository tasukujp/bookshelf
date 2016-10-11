Review.delete_all
UserBook.delete_all
User.delete_all
Book.delete_all

User.create!([
    { id: 1, name: 'develop', email: 'develop@example.com', password: 'developpw',
      confirmation_token: 'wUe2nSEj1vzEhMrnZTnb', confirmed_at: '2016-09-10 09:00:00', confirmation_sent_at: '2016-09-10 09:00:00' },
])

50.times do |n|
  id = n + 2
  no = format('%02d', id)
  name = "demo#{no}"
  email = "demo#{no}@example.com"
  password = "demo#{no}pw"
  confirmation_token = "wUe2nSEj1vzEhMrnZT#{no}"
  confirmed_at = "2016-09-10 09:00:#{no}"
  confirmation_sent_at = "2016-09-10 09:00:#{no}"
  User.create!(
      id: id, name: name, email: email, password: password, confirmation_token: confirmation_token,
      confirmed_at: confirmed_at, confirmation_sent_at: confirmation_sent_at
  )
end

Book.create!([
    { id: 1, isbn: '4797386290',
      title: 'たのしいRuby 第5版', author: '高橋 征義, 後藤 裕蔵',
      publisher: 'SBクリエイティブ', published: '2016/2/26',
      url: 'https://www.amazon.co.jp/dp/4797386290',
      image: 'https://images-na.ssl-images-amazon.com/images/I/71zUVNv4%2BjL.jpg' },
    { id: 2, isbn: '4774164100',
      title: 'Ruby on Rails 4 アプリケーションプログラミング', author: '山田 祥寛',
      publisher: '技術評論社', published: '2014/4/11',
      url: 'https://www.amazon.co.jp/dp/4774164100',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51lycs3O%2BrL.jpg' },
    { id: 3, isbn: '4774165166',
      title: 'パーフェクト Ruby on Rails', author: 'すがわら まさのり, 前島 真一, 近藤 宇智朗, 橋立 友宏',
      publisher: '技術評論社', published: '2014/6/6',
      url: 'https://www.amazon.co.jp/dp/4774165166',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51gar5P8bEL.jpg' },
    { id: 4, isbn: '4774166855',
      title: 'パーフェクトJava 改訂2版', author: '井上 誠一郎, 永井 雅人',
      publisher: '技術評論社', published: '2014/11/1',
      url: 'https://www.amazon.co.jp/dp/4774166855',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51Or5uklizL.jpg' },
    { id: 5, isbn: '4621066056',
      title: 'EFFECTIVE JAVA 第2版 (The Java Series)', author: 'Joshua Bloch, 柴田 芳樹',
      publisher: '丸善出版', published: '2014/3/11',
      url: 'https://www.amazon.co.jp/dp/4621066056',
      image: 'https://images-na.ssl-images-amazon.com/images/I/91tYrFpKmLL.jpg' },
    { id: 6, isbn: '4873117186',
      title: 'Javaパフォーマンス', author: 'Scott Oaks',
      publisher: 'オライリージャパン', published: '2015/4/11',
      url: 'https://www.amazon.co.jp/dp/4873117186',
      image: 'https://images-na.ssl-images-amazon.com/images/I/91euzd0lY4L.jpg' },
])

50.times do |n|
  id = n + 7
  no = format('%02d', id)
  isbn = "978-4-7973-00#{no}-X"
  title = "テスト本-#{no}"
  author = "テスト太郎-#{no}"
  publisher = "テスト出版社-#{no}"
  Book.create!(
      id: id, isbn: isbn, title: title, author: author,
      publisher: publisher, published: Time.current.to_date.to_s,
      updated_at: 1.hours.ago, created_at: 1.hours.ago
  )
end

UserBook.create!([
    { id: 1, user_id: 2, book_id: 2, rental_date: '2016-09-01 10:00:00',
      due_date: '2016-09-08 23:59:59', return_date: '2016-09-07 17:00:00'},
    { id: 2, user_id: 1, book_id: 10, rental_date: '2016-09-07 13:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 3, user_id: 1, book_id: 9, rental_date: '2016-09-07 15:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 4, user_id: 1, book_id: 8, rental_date: '2016-09-07 16:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 5, user_id: 1, book_id: 7, rental_date: '2016-09-07 17:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 6, user_id: 1, book_id: 6, rental_date: '2016-09-07 18:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 7, user_id: 1, book_id: 5, rental_date: '2016-09-07 19:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 8, user_id: 1, book_id: 4, rental_date: '2016-09-07 20:00:00',
      due_date: '2016-09-14 23:59:59', return_date: '2016-09-09 19:00:00'},
    { id: 9, user_id: 1, book_id: 3, rental_date: '2016-09-07 21:00:00',
      due_date: '2016-09-14 23:59:59', return_date: nil},
    { id: 10, user_id: 1, book_id: 2, rental_date: '2016-09-07 22:00:00',
      due_date: '2016-09-14 23:59:59', return_date: nil},
    { id: 11, user_id: 1, book_id: 1, rental_date: '2016-09-07 23:00:00',
      due_date: '2016-09-14 23:59:59', return_date: nil},
])

50.times do |n|
  id = n + 1
  no = format('%02d', id)
  user_id = id
  book_id = 1
  comment = "テストコメント#{no}"
  Review.create!(
      id: id, user_id: user_id, book_id: book_id, comment: comment
  )
end
