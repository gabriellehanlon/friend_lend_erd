class AddItemCountToItemTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :item_types, :items_count, :integer
  end
end
