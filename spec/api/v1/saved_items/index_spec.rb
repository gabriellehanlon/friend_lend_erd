require "rails_helper"

RSpec.describe "saved_items#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_items", params: params
  end

  describe "basic fetch" do
    let!(:saved_item1) { create(:saved_item) }
    let!(:saved_item2) { create(:saved_item) }

    it "works" do
      expect(SavedItemResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["saved_items"])
      expect(d.map(&:id)).to match_array([saved_item1.id, saved_item2.id])
    end
  end
end
