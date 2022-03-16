require "rails_helper"

RSpec.describe "number_sizes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/number_sizes/#{number_size.id}", payload
  end

  describe "basic update" do
    let!(:number_size) { create(:number_size) }

    let(:payload) do
      {
        data: {
          id: number_size.id.to_s,
          type: "number_sizes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(NumberSizeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { number_size.reload.attributes }
    end
  end
end
