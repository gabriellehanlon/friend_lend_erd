require "rails_helper"

RSpec.describe "number_sizes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/number_sizes", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "number_sizes",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(NumberSizeResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { NumberSize.count }.by(1)
    end
  end
end
