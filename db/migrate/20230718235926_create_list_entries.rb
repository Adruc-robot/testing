class CreateListEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :list_entries do |t|
      t.references :list, null: false, foreign_key: true
      t.string :name
      t.string :value
      t.integer :order_number

      t.timestamps
    end
  end
end
