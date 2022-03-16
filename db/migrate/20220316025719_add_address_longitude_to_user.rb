class AddAddressLongitudeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address_longitude, :float
  end
end
