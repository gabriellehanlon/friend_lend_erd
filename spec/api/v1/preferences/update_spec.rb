require "rails_helper"

RSpec.describe "preferences#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/preferences/#{preference.id}", payload
  end

  describe "basic update" do
    let!(:preference) { create(:preference) }

    let(:payload) do
      {
        data: {
          id: preference.id.to_s,
          type: "preferences",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PreferenceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { preference.reload.attributes }
    end
  end
end
