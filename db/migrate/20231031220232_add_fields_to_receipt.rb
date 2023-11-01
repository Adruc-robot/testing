class AddFieldsToReceipt < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :purchase_date, :date
    add_column :receipts, :po_number, :string
  end
end
