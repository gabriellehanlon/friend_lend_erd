require "rails_helper"

RSpec.describe "number_sizes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/number_sizes/#{number_size.id}"
  end

  describe "basic destroy" do
    let!(:number_size) { create(:number_size) }

    it "updates the resource" do
      expect(NumberSizeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { NumberSize.count }.by(-1)
      expect { number_size.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
