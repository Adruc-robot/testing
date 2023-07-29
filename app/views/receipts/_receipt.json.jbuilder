json.extract! receipt, :id, :user_id, :business_id, :subtotal, :total, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
