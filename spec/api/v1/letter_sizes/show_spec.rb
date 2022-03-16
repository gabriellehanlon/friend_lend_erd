require "rails_helper"

RSpec.describe "letter_sizes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/letter_sizes/#{letter_size.id}", params: params
  end

  describe "basic fetch" do
    let!(:letter_size) { create(:letter_size) }

    it "works" do
      expect(LetterSizeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("letter_sizes")
      expect(d.id).to eq(letter_size.id)
    end
  end
end
