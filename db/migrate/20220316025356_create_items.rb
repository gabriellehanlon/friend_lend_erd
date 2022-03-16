class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :closet_id
      t.text :item_name
      t.integer :item_type_id
      t.integer :style_id
      t.integer :letter_size_id
      t.integer :number_size_id
      t.string :item_description
      t.string :photos

      t.timestamps
    end
  end
end
