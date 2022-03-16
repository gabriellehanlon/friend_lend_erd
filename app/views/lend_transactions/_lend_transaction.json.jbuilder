json.extract! lend_transaction, :id, :lender_id, :user_lending_id,
              :pickup_date_time, :rental_period, :item_id, :chat_history, :created_at, :updated_at
json.url lend_transaction_url(lend_transaction, format: :json)
