class AddImageUserdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_user, :string
  end
end
