class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :closet_id, :integer
  attribute :item_name, :string
  attribute :item_type_id, :integer
  attribute :style_id, :integer
  attribute :letter_size_id, :integer
  attribute :number_size_id, :integer
  attribute :item_description, :string
  attribute :photos, :string

  # Direct associations

  belongs_to :style

  # Indirect associations

end
