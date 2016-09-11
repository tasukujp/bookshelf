class CreateUserBooks < ActiveRecord::Migration
  def change
    create_table :user_books do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :book, index: true, foreign_key: true, null: false
      t.datetime :rental_date, null: false
      t.datetime :due_date, null: false
      t.datetime :return_date

      t.timestamps null: false
    end
  end
end
