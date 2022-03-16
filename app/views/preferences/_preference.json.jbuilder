json.extract! preference, :id, :user_id, :number_size_id, :letter_size_id,
              :style_id, :created_at, :updated_at
json.url preference_url(preference, format: :json)
