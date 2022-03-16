require 'rails_helper'

RSpec.describe LetterSize, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:size) }

    it { should validate_presence_of(:size) }

    end
end
