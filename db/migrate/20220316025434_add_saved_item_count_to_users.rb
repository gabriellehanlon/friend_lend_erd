class AddSavedItemCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :saved_items_count, :integer
  end
end
