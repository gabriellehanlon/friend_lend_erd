class NumberSize < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :size, :numericality => true

  # Scopes

  def to_s
    size
  end

end
