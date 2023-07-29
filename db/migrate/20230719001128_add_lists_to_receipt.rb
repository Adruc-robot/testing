class AddListsToReceipt < ActiveRecord::Migration[7.0]
  def change
    add_column :receipts, :list, :string
    add_column :receipts, :list_entry, :string
  end
end
