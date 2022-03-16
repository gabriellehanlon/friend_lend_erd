class AddStyleReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :styles
    add_index :items, :style_id
  end
end
