class ClosetResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer

  # Direct associations

  has_many   :items

  belongs_to :user

  # Indirect associations

end
