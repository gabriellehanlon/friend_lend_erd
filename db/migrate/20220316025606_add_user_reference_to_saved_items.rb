class AddUserReferenceToSavedItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_items, :users
    add_index :saved_items, :user_id
    change_column_null :saved_items, :user_id, false
  end
end
