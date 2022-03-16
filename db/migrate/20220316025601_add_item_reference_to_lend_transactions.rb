class AddItemReferenceToLendTransactions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :lend_transactions, :items
    add_index :lend_transactions, :item_id
    change_column_null :lend_transactions, :item_id, false
  end
end
