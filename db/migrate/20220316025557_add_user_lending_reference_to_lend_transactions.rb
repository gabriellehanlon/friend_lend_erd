class AddUserLendingReferenceToLendTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lend_transactions, :users, column: :user_lending_id
    add_index :lend_transactions, :user_lending_id
    change_column_null :lend_transactions, :user_lending_id, false
  end
end
