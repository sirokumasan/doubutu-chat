class CreateMessageTags < ActiveRecord::Migration[5.0]
  def change
    create_table :message_tags do |t|
      t.references   :message,  null: false, foreign_key: true
      t.references   :tag,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
