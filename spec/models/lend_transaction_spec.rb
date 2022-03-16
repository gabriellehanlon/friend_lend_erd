require "rails_helper"

RSpec.describe LendTransaction, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:item) }

    it { should belong_to(:user_lending) }

    it { should belong_to(:lender) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it {
      should validate_presence_of(:pickup_date_time).with_message("Please select a pickup date and time")
    }

    it {
      should validate_presence_of(:rental_period).with_message("Please designate how long you would like to borrow this item")
    }
  end
end
