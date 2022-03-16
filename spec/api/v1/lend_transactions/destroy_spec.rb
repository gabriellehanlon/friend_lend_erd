require "rails_helper"

RSpec.describe "lend_transactions#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/lend_transactions/#{lend_transaction.id}"
  end

  describe "basic destroy" do
    let!(:lend_transaction) { create(:lend_transaction) }

    it "updates the resource" do
      expect(LendTransactionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { LendTransaction.count }.by(-1)
      expect { lend_transaction.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
