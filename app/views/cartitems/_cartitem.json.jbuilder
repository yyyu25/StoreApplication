json.extract! cartitem, :id, :product_id, :cart_id, :created_at, :updated_at
json.url cartitem_url(cartitem, format: :json)
