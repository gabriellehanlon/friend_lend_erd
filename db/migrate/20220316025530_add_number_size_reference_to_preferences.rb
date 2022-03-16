class AddNumberSizeReferenceToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :preferences, :number_sizes
    add_index :preferences, :number_size_id
    change_column_null :preferences, :number_size_id, false
  end
end
