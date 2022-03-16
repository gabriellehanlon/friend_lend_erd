class LendTransactionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :lender_id, :integer
  attribute :user_lending_id, :integer
  attribute :pickup_date_time, :datetime
  attribute :rental_period, :string
  attribute :item_id, :integer
  attribute :chat_history, :string

  # Direct associations

  belongs_to :lender,
             resource: UserResource

  # Indirect associations

end
