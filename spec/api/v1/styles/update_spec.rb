require 'rails_helper'

RSpec.describe "styles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/styles/#{style.id}", payload
  end

  describe 'basic update' do
    let!(:style) { create(:style) }

    let(:payload) do
      {
        data: {
          id: style.id.to_s,
          type: 'styles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(StyleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { style.reload.attributes }
    end
  end
end
