class AddUserReferenceToClosets < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :closets, :users
    add_index :closets, :user_id
    change_column_null :closets, :user_id, false
  end
end
