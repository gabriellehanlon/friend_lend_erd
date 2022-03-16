class AddItemTypeReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :item_types
    add_index :items, :item_type_id
    change_column_null :items, :item_type_id, false
  end
end
