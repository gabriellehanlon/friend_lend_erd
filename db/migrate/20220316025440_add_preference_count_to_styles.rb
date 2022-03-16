class AddPreferenceCountToStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :styles, :preferences_count, :integer
  end
end
