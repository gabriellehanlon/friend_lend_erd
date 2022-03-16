require "rails_helper"

RSpec.describe "saved_items#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_items/#{saved_item.id}", params: params
  end

  describe "basic fetch" do
    let!(:saved_item) { create(:saved_item) }

    it "works" do
      expect(SavedItemResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("saved_items")
      expect(d.id).to eq(saved_item.id)
    end
  end
end
