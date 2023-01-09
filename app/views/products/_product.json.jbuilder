json.extract! product, :id, :name, :price, :status, :quantity, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
