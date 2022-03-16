class PreferenceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :number_size_id, :integer
  attribute :letter_size_id, :integer
  attribute :style_id, :integer

  # Direct associations

  # Indirect associations

end