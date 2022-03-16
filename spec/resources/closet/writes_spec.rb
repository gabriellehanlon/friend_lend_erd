require 'rails_helper'

RSpec.describe ClosetResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'closets',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ClosetResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Closet.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:closet) { create(:closet) }

    let(:payload) do
      {
        data: {
          id: closet.id.to_s,
          type: 'closets',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ClosetResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { closet.reload.updated_at }
      # .and change { closet.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:closet) { create(:closet) }

    let(:instance) do
      ClosetResource.find(id: closet.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Closet.count }.by(-1)
    end
  end
end