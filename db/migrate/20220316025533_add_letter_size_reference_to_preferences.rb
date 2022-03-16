class AddLetterSizeReferenceToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :preferences, :letter_sizes
    add_index :preferences, :letter_size_id
    change_column_null :preferences, :letter_size_id, false
  end
end
