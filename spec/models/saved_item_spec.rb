require "rails_helper"

RSpec.describe SavedItem, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:item) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
