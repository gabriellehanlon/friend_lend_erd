require "rails_helper"

RSpec.describe "preferences#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/preferences", params: params
  end

  describe "basic fetch" do
    let!(:preference1) { create(:preference) }
    let!(:preference2) { create(:preference) }

    it "works" do
      expect(PreferenceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["preferences"])
      expect(d.map(&:id)).to match_array([preference1.id, preference2.id])
    end
  end
end
