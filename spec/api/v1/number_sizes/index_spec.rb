require "rails_helper"

RSpec.describe "number_sizes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/number_sizes", params: params
  end

  describe "basic fetch" do
    let!(:number_size1) { create(:number_size) }
    let!(:number_size2) { create(:number_size) }

    it "works" do
      expect(NumberSizeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["number_sizes"])
      expect(d.map(&:id)).to match_array([number_size1.id, number_size2.id])
    end
  end
end
