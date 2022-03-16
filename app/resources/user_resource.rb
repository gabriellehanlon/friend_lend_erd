class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :address, :string

  # Direct associations

  has_many   :saved_items

  has_many   :items_borrowed,
             resource: LendTransactionResource,
             foreign_key: :user_lending_id

  has_many   :lend_transactions,
             foreign_key: :lender_id

  has_many   :preferences

  has_many   :closets

  # Indirect associations

  many_to_many :number_sizes

end
