class AddLetterSizeReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :letter_sizes
    add_index :items, :letter_size_id
  end
end
