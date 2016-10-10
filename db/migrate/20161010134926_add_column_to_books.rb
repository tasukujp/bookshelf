class AddColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reviews_count, :integer, null: false, default: 0, after: :users_count
  end
end
