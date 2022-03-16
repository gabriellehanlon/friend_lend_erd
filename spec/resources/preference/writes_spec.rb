require 'rails_helper'

RSpec.describe PreferenceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'preferences',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PreferenceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Preference.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:preference) { create(:preference) }

    let(:payload) do
      {
        data: {
          id: preference.id.to_s,
          type: 'preferences',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PreferenceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { preference.reload.updated_at }
      # .and change { preference.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:preference) { create(:preference) }

    let(:instance) do
      PreferenceResource.find(id: preference.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Preference.count }.by(-1)
    end
  end
end
