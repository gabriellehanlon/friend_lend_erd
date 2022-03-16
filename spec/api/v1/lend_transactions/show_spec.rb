require "rails_helper"

RSpec.describe "lend_transactions#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/lend_transactions/#{lend_transaction.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:lend_transaction) { create(:lend_transaction) }

    it "works" do
      expect(LendTransactionResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("lend_transactions")
      expect(d.id).to eq(lend_transaction.id)
    end
  end
end
