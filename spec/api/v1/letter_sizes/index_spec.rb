require "rails_helper"

RSpec.describe "letter_sizes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/letter_sizes", params: params
  end

  describe "basic fetch" do
    let!(:letter_size1) { create(:letter_size) }
    let!(:letter_size2) { create(:letter_size) }

    it "works" do
      expect(LetterSizeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["letter_sizes"])
      expect(d.map(&:id)).to match_array([letter_size1.id, letter_size2.id])
    end
  end
end
