require 'rails_helper'

RSpec.describe "saved_items#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/saved_items/#{saved_item.id}", payload
  end

  describe 'basic update' do
    let!(:saved_item) { create(:saved_item) }

    let(:payload) do
      {
        data: {
          id: saved_item.id.to_s,
          type: 'saved_items',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SavedItemResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { saved_item.reload.attributes }
    end
  end
end
