require "rails_helper"

RSpec.describe "item_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/item_types/#{item_type.id}", params: params
  end

  describe "basic fetch" do
    let!(:item_type) { create(:item_type) }

    it "works" do
      expect(ItemTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("item_types")
      expect(d.id).to eq(item_type.id)
    end
  end
end
