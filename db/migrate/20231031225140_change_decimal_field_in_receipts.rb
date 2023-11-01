class ChangeDecimalFieldInReceipts < ActiveRecord::Migration[7.0]
  def change
    change_column :receipts, :subtotal, :decimal, precision: 8, scale: 2
    change_column :receipts, :total, :decimal, precision: 8, scale: 2
  end
end
