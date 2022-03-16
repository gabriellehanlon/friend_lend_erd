class CreatePreferences < ActiveRecord::Migration[6.0]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.integer :number_size_id
      t.integer :letter_size_id
      t.integer :style_id

      t.timestamps
    end
  end
end
