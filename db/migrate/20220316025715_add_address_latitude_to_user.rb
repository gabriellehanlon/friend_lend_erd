class AddAddressLatitudeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address_latitude, :float
  end
end
