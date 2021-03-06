class SavedItem < ApplicationRecord
  # Direct associations

  belongs_to :item

  belongs_to :user,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item.to_s
  end
end
