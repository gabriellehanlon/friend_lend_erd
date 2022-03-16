class LendTransaction < ApplicationRecord
  # Direct associations

  belongs_to :lender,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :pickup_date_time, :presence => { :message => "Please select a pickup date and time" }

  validates :rental_period, :presence => { :message => "Please designate how long you would like to borrow this item" }

  # Scopes

  def to_s
    lender.to_s
  end

end
