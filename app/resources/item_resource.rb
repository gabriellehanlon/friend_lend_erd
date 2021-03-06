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

  belongs_to :number_size

  belongs_to :letter_size

  belongs_to :item_type

  has_many   :saved_items

  has_many   :lend_transactions

  belongs_to :closet

  belongs_to :style

  # Indirect associations

  has_one    :user

  filter :user_id, :integer do
    eq do |scope, value|
      scope.eager_load(:user).where(closets: { user_id: value })
    end
  end
end
