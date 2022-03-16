class AddUserReferenceToPreferences < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :preferences, :users
    add_index :preferences, :user_id
    change_column_null :preferences, :user_id, false
  end
end
