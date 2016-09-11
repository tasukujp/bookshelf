User.delete_all
User.create!([
    { name: 'development', email: 'development@example.com', password: 'hogehoge',
      confirmation_token: 'wUe2nSEj1vzEhMrnZTnb', confirmed_at: '2016-09-10 09:00:00', confirmation_sent_at: '2016-09-10 09:00:00' }
])

Book.delete_all
Book.create!([
    { isbn: '4797386290',
      title: 'たのしいRuby 第5版', author: '高橋 征義, 後藤 裕蔵',
      publisher: 'SBクリエイティブ', published: '2016/2/26',
      url: 'https://www.amazon.co.jp/dp/4797386290',
      image: 'https://images-na.ssl-images-amazon.com/images/I/71zUVNv4%2BjL.jpg' },
    { isbn: '4774164100',
      title: 'Ruby on Rails 4 アプリケーションプログラミング', author: '山田 祥寛',
      publisher: '技術評論社', published: '2014/4/11',
      url: 'https://www.amazon.co.jp/dp/4774164100',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51lycs3O%2BrL.jpg' },
    { isbn: '4774165166',
      title: 'パーフェクト Ruby on Rails', author: 'すがわら まさのり, 前島 真一, 近藤 宇智朗, 橋立 友宏',
      publisher: '技術評論社', published: '2014/6/6',
      url: 'https://www.amazon.co.jp/dp/4774165166',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51gar5P8bEL.jpg' },
    { isbn: '4774166855',
      title: 'パーフェクトJava 改訂2版', author: '井上 誠一郎, 永井 雅人',
      publisher: '技術評論社', published: '2014/11/1',
      url: 'https://www.amazon.co.jp/dp/4774166855',
      image: 'https://images-na.ssl-images-amazon.com/images/I/51Or5uklizL.jpg' },
    { isbn: '4621066056',
      title: 'EFFECTIVE JAVA 第2版 (The Java Series)', author: 'Joshua Bloch, 柴田 芳樹',
      publisher: '丸善出版', published: '2014/3/11',
      url: 'https://www.amazon.co.jp/dp/4621066056',
      image: 'https://images-na.ssl-images-amazon.com/images/I/91tYrFpKmLL.jpg' },
    { isbn: '4873117186',
      title: 'Javaパフォーマンス', author: 'Scott Oaks',
      publisher: 'オライリージャパン', published: '2015/4/11',
      url: 'https://www.amazon.co.jp/dp/4873117186',
      image: 'https://images-na.ssl-images-amazon.com/images/I/91euzd0lY4L.jpg' }
])
