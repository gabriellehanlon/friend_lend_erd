class LetterSize < ApplicationRecord
  # Direct associations

  has_many   :items

  has_many   :preferences,
             :dependent => :nullify

  # Indirect associations

  # Validations

  validates :size, :uniqueness => true

  validates :size, :presence => true

  # Scopes

  def to_s
    size
  end

end
