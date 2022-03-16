class CreateSavedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_items do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
