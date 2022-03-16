require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:saved_items) }

    it { should have_many(:items_borrowed) }

    it { should have_many(:lend_transactions) }

    it { should have_many(:preferences) }

    it { should have_many(:closets) }

    end

    describe "InDirect Associations" do

    it { should have_many(:letter_sizes) }

    it { should have_many(:number_sizes) }

    end

    describe "Validations" do

    end
end
