class RemoveListsFromReceipts < ActiveRecord::Migration[7.0]
  def change
    remove_column :receipts, :list, :string
    remove_column :receipts, :list_entry, :string
  end
end
