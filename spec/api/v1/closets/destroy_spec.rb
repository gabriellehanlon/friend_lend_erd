require "rails_helper"

RSpec.describe "closets#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/closets/#{closet.id}"
  end

  describe "basic destroy" do
    let!(:closet) { create(:closet) }

    it "updates the resource" do
      expect(ClosetResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Closet.count }.by(-1)
      expect { closet.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
