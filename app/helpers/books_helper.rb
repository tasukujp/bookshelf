# frozen_string_literal: true
module BooksHelper
  # 画像が登録されていない場合はデフォルト画像を返す
  def book_image_or_default(image)
    image.present? ? image : 'default_book.png'
  end
end
