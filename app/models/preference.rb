class Preference < ApplicationRecord
  # Direct associations

  belongs_to :number_size

  belongs_to :letter_size

  belongs_to :style,
             optional: true,
             counter_cache: true

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
