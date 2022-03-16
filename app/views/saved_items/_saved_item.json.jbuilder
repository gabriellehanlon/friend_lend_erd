json.extract! saved_item, :id, :item_id, :user_id, :created_at, :updated_at
json.url saved_item_url(saved_item, format: :json)
