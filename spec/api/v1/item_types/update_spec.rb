require "rails_helper"

RSpec.describe "item_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/item_types/#{item_type.id}", payload
  end

  describe "basic update" do
    let!(:item_type) { create(:item_type) }

    let(:payload) do
      {
        data: {
          id: item_type.id.to_s,
          type: "item_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ItemTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { item_type.reload.attributes }
    end
  end
end
