require 'rails_helper'

RSpec.describe ItemType, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:name) }

    it { should validate_presence_of(:name).with_message('Please name the item type') }

    end
end
