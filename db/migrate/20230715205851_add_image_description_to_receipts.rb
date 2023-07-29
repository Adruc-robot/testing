class AddImageDescriptionToReceipts < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :image_description, :text
  end
end
