require "rails_helper"

RSpec.describe "closets#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/closets/#{closet.id}", payload
  end

  describe "basic update" do
    let!(:closet) { create(:closet) }

    let(:payload) do
      {
        data: {
          id: closet.id.to_s,
          type: "closets",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ClosetResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { closet.reload.attributes }
    end
  end
end
