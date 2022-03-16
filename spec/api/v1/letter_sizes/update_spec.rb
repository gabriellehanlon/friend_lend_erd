require 'rails_helper'

RSpec.describe "letter_sizes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/letter_sizes/#{letter_size.id}", payload
  end

  describe 'basic update' do
    let!(:letter_size) { create(:letter_size) }

    let(:payload) do
      {
        data: {
          id: letter_size.id.to_s,
          type: 'letter_sizes',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(LetterSizeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { letter_size.reload.attributes }
    end
  end
end
