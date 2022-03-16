require 'rails_helper'

RSpec.describe NumberSize, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:preferences) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:size) }

    it { should validate_presence_of(:size) }

    it { should validate_numericality_of(:size) }

    end
end
