class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reviews_count, :integer, null: false, default: 0, after: :books_count
  end
end
