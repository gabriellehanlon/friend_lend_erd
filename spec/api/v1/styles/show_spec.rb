require 'rails_helper'

RSpec.describe "styles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/styles/#{style.id}", params: params
  end

  describe 'basic fetch' do
    let!(:style) { create(:style) }

    it 'works' do
      expect(StyleResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('styles')
      expect(d.id).to eq(style.id)
    end
  end
end
