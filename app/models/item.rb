class Item < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :item_type_id, :presence => { :message => "Please select an item type" }

  validates :photos, :presence => true

  # Scopes

  def to_s
    closet.to_s
  end

end
