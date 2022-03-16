json.extract! item, :id, :closet_id, :item_name, :item_type_id, :style_id,
              :letter_size_id, :number_size_id, :item_description, :photos, :created_at, :updated_at
json.url item_url(item, format: :json)
