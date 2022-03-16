require 'rails_helper'

RSpec.describe "preferences#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/preferences/#{preference.id}", params: params
  end

  describe 'basic fetch' do
    let!(:preference) { create(:preference) }

    it 'works' do
      expect(PreferenceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('preferences')
      expect(d.id).to eq(preference.id)
    end
  end
end
