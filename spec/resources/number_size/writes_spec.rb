require "rails_helper"

RSpec.describe NumberSizeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "number_sizes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      NumberSizeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { NumberSize.count }.by(1)
    end
  end

  describe "updating" do
    let!(:number_size) { create(:number_size) }

    let(:payload) do
      {
        data: {
          id: number_size.id.to_s,
          type: "number_sizes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      NumberSizeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { number_size.reload.updated_at }
      # .and change { number_size.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:number_size) { create(:number_size) }

    let(:instance) do
      NumberSizeResource.find(id: number_size.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { NumberSize.count }.by(-1)
    end
  end
end
