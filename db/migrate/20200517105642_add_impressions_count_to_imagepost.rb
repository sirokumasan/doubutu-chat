class AddImpressionsCountToImagepost < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :impressions_count, :integer, default: 0 
  end
end