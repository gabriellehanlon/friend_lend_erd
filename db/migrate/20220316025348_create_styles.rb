class CreateStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :styles do |t|
      t.text :style_name

      t.timestamps
    end
  end
end
