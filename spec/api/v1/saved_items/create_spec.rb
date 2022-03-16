require 'rails_helper'

RSpec.describe "saved_items#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/saved_items", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'saved_items',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SavedItemResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SavedItem.count }.by(1)
    end
  end
end
