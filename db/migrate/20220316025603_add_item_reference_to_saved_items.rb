class AddItemReferenceToSavedItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_items, :items
    add_index :saved_items, :item_id
    change_column_null :saved_items, :item_id, false
  end
end
