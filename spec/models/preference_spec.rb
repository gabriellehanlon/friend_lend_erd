require "rails_helper"

RSpec.describe Preference, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:number_size) }

    it { should belong_to(:letter_size) }

    it { should belong_to(:style) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
