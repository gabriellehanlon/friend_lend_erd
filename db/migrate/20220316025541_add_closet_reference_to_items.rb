class AddClosetReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :closets
    add_index :items, :closet_id
    change_column_null :items, :closet_id, false
  end
end
