json.extract! list_entry, :id, :list_id, :name, :value, :order_number, :created_at, :updated_at
json.url list_entry_url(list_entry, format: :json)
