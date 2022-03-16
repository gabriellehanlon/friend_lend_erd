require "rails_helper"

RSpec.describe ItemTypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "item_types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ItemTypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { ItemType.count }.by(1)
    end
  end

  describe "updating" do
    let!(:item_type) { create(:item_type) }

    let(:payload) do
      {
        data: {
          id: item_type.id.to_s,
          type: "item_types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ItemTypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { item_type.reload.updated_at }
      # .and change { item_type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:item_type) { create(:item_type) }

    let(:instance) do
      ItemTypeResource.find(id: item_type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { ItemType.count }.by(-1)
    end
  end
end
