require 'rails_helper'

RSpec.describe SavedItemResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'saved_items',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SavedItemResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SavedItem.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:saved_item) { create(:saved_item) }

    let(:payload) do
      {
        data: {
          id: saved_item.id.to_s,
          type: 'saved_items',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SavedItemResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { saved_item.reload.updated_at }
      # .and change { saved_item.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:saved_item) { create(:saved_item) }

    let(:instance) do
      SavedItemResource.find(id: saved_item.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SavedItem.count }.by(-1)
    end
  end
end
