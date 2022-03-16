require "rails_helper"

RSpec.describe StyleResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "styles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      StyleResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Style.count }.by(1)
    end
  end

  describe "updating" do
    let!(:style) { create(:style) }

    let(:payload) do
      {
        data: {
          id: style.id.to_s,
          type: "styles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      StyleResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { style.reload.updated_at }
      # .and change { style.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:style) { create(:style) }

    let(:instance) do
      StyleResource.find(id: style.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Style.count }.by(-1)
    end
  end
end
