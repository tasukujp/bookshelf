class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :book, index: true, foreign_key: true, null: false
      t.text :comment, null: false

      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :book_id], unique: true
  end
end
