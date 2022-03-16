class AddLendTransactionCountToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :lend_transactions_count, :integer
  end
end
