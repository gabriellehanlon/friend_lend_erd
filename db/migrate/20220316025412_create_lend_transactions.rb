class CreateLendTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :lend_transactions do |t|
      t.integer :lender_id
      t.integer :user_lending_id
      t.datetime :pickup_date_time
      t.time :rental_period
      t.integer :item_id
      t.text :chat_history

      t.timestamps
    end
  end
end
