require "rails_helper"

RSpec.describe "lend_transactions#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/lend_transactions/#{lend_transaction.id}", payload
  end

  describe "basic update" do
    let!(:lend_transaction) { create(:lend_transaction) }

    let(:payload) do
      {
        data: {
          id: lend_transaction.id.to_s,
          type: "lend_transactions",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(LendTransactionResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { lend_transaction.reload.attributes }
    end
  end
end
