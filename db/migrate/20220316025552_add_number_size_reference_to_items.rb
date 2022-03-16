class AddNumberSizeReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :number_sizes
    add_index :items, :number_size_id
  end
end
