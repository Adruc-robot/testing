json.extract! account, :id, :user_id, :account_number, :alias, :created_at, :updated_at
json.url account_url(account, format: :json)
