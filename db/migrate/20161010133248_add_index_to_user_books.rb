class AddIndexToUserBooks < ActiveRecord::Migration
  def change
    add_index :user_books, [:user_id, :book_id], unique: true
  end
end
