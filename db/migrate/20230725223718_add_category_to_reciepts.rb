class AddCategoryToReciepts < ActiveRecord::Migration[7.0]
  def change
    add_reference :receipts, :list, null: true, foreign_key: true
    add_reference :receipts, :list_entry, null: true, foreign_key: true
  end
end
