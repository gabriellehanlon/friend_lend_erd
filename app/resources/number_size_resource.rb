class NumberSizeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :size, :integer

  # Direct associations

  # Indirect associations

end
