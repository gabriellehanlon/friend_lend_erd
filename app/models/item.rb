class Item < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :photos, :presence => true

  # Scopes

  def to_s
    closet.to_s
  end

end
