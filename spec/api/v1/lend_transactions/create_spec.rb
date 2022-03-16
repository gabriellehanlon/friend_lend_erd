require 'rails_helper'

RSpec.describe "lend_transactions#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/lend_transactions", payload
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
          type: 'lend_transactions',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(LendTransactionResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { LendTransaction.count }.by(1)
    end
  end
end
