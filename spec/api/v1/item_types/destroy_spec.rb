require "rails_helper"

RSpec.describe "item_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/item_types/#{item_type.id}"
  end

  describe "basic destroy" do
    let!(:item_type) { create(:item_type) }

    it "updates the resource" do
      expect(ItemTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ItemType.count }.by(-1)
      expect { item_type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
