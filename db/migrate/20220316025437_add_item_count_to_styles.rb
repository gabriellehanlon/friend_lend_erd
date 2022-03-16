class AddItemCountToStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :styles, :items_count, :integer
  end
end
