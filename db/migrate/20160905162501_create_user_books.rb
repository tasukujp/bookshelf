class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :book, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
    add_index :user_books, [:user_id, :book_id], unique: true
  end
end
