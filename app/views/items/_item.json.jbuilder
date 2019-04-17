json.extract! item, :id, :title, :image_url, :price, :color, :category, :brand, :description, :created_at, :updated_at
json.url item_url(item, format: :json)
