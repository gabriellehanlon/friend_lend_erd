class ItemType < ApplicationRecord
  # Direct associations

  has_many   :items,
             dependent: :nullify

  # Indirect associations

  # Validations

  validates :name, uniqueness: true

  validates :name, presence: { message: "Please name the item type" }

  # Scopes

  def to_s
    name
  end
end
