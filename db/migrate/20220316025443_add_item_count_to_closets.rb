class AddItemCountToClosets < ActiveRecord::Migration[6.0]
  def change
    add_column :closets, :items_count, :integer
  end
end
