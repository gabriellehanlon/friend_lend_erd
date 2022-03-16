require "rails_helper"

RSpec.describe "item_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/item_types", params: params
  end

  describe "basic fetch" do
    let!(:item_type1) { create(:item_type) }
    let!(:item_type2) { create(:item_type) }

    it "works" do
      expect(ItemTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["item_types"])
      expect(d.map(&:id)).to match_array([item_type1.id, item_type2.id])
    end
  end
end
