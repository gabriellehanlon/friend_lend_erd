require 'rails_helper'

RSpec.describe Style, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:style_name).with_message('Enter new style name') }

    end
end
