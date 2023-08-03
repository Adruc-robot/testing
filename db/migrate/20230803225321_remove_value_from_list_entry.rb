class RemoveValueFromListEntry < ActiveRecord::Migration[7.0]
  def change
    remove_column :list_entries, :value, :string
  end
end
