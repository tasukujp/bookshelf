class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :manufacturer
      t.string :image_url
      t.string :page_url

      t.timestamps null: false
    end
    add_index :books, :isbn, unique: true
  end
end
