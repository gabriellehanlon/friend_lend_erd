class CreateNumberSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :number_sizes do |t|
      t.integer :size

      t.timestamps
    end
  end
end
