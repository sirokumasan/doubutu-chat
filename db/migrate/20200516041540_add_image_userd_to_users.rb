class AddImageUserdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pfofiel, :string
  end
end
