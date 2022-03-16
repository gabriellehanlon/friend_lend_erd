require 'rails_helper'

RSpec.describe "number_sizes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/number_sizes/#{number_size.id}", params: params
  end

  describe 'basic fetch' do
    let!(:number_size) { create(:number_size) }

    it 'works' do
      expect(NumberSizeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('number_sizes')
      expect(d.id).to eq(number_size.id)
    end
  end
end
