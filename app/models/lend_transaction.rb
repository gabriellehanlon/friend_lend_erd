class LendTransaction < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rental_period, :presence => { :message => "Please designate how long you would like to borrow this item" }

  # Scopes

  def to_s
    lender.to_s
  end

end
