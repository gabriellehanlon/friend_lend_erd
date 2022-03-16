class AddItemsBorrowedCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :items_borrowed_count, :integer
  end
end
