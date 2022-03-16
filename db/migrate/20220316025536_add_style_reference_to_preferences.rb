class AddStyleReferenceToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :preferences, :styles
    add_index :preferences, :style_id
  end
end
