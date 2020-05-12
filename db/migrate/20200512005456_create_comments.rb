class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :message,   null: false, foreign_key: true  
      t.timestamps
    end
  end
end