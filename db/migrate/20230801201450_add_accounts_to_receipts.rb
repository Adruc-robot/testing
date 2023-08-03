class AddAccountsToReceipts < ActiveRecord::Migration[7.0]
  def change
    add_reference :receipts, :account, null: true, foreign_key: true
  end
end
