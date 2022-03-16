require "rails_helper"

RSpec.describe "closets#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/closets", params: params
  end

  describe "basic fetch" do
    let!(:closet1) { create(:closet) }
    let!(:closet2) { create(:closet) }

    it "works" do
      expect(ClosetResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["closets"])
      expect(d.map(&:id)).to match_array([closet1.id, closet2.id])
    end
  end
end
