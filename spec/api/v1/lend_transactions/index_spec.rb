require "rails_helper"

RSpec.describe "lend_transactions#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/lend_transactions", params: params
  end

  describe "basic fetch" do
    let!(:lend_transaction1) { create(:lend_transaction) }
    let!(:lend_transaction2) { create(:lend_transaction) }

    it "works" do
      expect(LendTransactionResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["lend_transactions"])
      expect(d.map(&:id)).to match_array([lend_transaction1.id,
                                          lend_transaction2.id])
    end
  end
end
