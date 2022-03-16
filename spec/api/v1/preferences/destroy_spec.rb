require "rails_helper"

RSpec.describe "preferences#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/preferences/#{preference.id}"
  end

  describe "basic destroy" do
    let!(:preference) { create(:preference) }

    it "updates the resource" do
      expect(PreferenceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Preference.count }.by(-1)
      expect { preference.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
