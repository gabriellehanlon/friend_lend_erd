class ItemType < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :name, :presence => { :message => "Please name the item type" }

  # Scopes

  def to_s
    name
  end

end
