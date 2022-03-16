require 'rails_helper'

RSpec.describe "closets#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/closets/#{closet.id}", params: params
  end

  describe 'basic fetch' do
    let!(:closet) { create(:closet) }

    it 'works' do
      expect(ClosetResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('closets')
      expect(d.id).to eq(closet.id)
    end
  end
end
