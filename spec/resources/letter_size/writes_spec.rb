require "rails_helper"

RSpec.describe LetterSizeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "letter_sizes",
          attributes: {},
        },
      }
    end

    let(:instance) do
      LetterSizeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { LetterSize.count }.by(1)
    end
  end

  describe "updating" do
    let!(:letter_size) { create(:letter_size) }

    let(:payload) do
      {
        data: {
          id: letter_size.id.to_s,
          type: "letter_sizes",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      LetterSizeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { letter_size.reload.updated_at }
      # .and change { letter_size.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:letter_size) { create(:letter_size) }

    let(:instance) do
      LetterSizeResource.find(id: letter_size.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { LetterSize.count }.by(-1)
    end
  end
end
