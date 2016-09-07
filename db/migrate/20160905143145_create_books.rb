class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn, null: false
      t.string :title, null: false
      t.string :author
      t.string :publisher
      t.string :url
      t.string :image

      t.timestamps null: false
    end
    add_index :books, :isbn, unique: true
  end
end
