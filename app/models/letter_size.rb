class LetterSize < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :size, :uniqueness => true

  validates :size, :presence => true

  # Scopes

  def to_s
    size
  end

end
