class CreateLetterSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :letter_sizes do |t|
      t.text :size

      t.timestamps
    end
  end
end
