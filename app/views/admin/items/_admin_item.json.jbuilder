json.extract! admin_item, :id, :name, :price, :created_at, :updated_at
json.url admin_item_url(admin_item, format: :json)
