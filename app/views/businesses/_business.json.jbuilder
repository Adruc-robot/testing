json.extract! business, :id, :user_id, :name, :address, :phone_number, :notes, :created_at, :updated_at
json.url business_url(business, format: :json)
