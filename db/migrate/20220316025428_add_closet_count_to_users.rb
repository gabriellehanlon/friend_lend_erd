class AddClosetCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :closets_count, :integer
  end
end