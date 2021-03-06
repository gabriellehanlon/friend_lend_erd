class NumberSize < ApplicationRecord
  # Direct associations

  has_many   :items

  has_many   :preferences,
             dependent: :nullify

  # Indirect associations

  has_many   :users,
             through: :preferences,
             source: :user

  # Validations

  validates :size, uniqueness: true

  validates :size, presence: true

  validates :size, numericality: true

  # Scopes

  def to_s
    size
  end
end
