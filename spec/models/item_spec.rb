require 'rails_helper'

RSpec.describe Item, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:style) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:item_name).with_message('Please label item') }

    it { should validate_presence_of(:item_type_id).with_message('Please select an item type') }

    it { should validate_presence_of(:photos) }

    end
end
