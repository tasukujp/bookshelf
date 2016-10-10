class AddUserImageToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_image, :string, after: :books_count
  end
end
