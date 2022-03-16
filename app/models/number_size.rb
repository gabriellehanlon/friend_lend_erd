class NumberSize < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :size, :uniqueness => true

  validates :size, :presence => true

  validates :size, :numericality => true

  # Scopes

  def to_s
    size
  end

end
