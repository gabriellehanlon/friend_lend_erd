class AddLenderReferenceToLendTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lend_transactions, :users, column: :lender_id
    add_index :lend_transactions, :lender_id
    change_column_null :lend_transactions, :lender_id, false
  end
end
