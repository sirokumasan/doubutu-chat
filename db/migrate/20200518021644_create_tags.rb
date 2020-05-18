class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string      :tag_name,  null: false
      t.references  :message,   null: false, foreign_key: true

      t.timestamps
    end
  end
end
