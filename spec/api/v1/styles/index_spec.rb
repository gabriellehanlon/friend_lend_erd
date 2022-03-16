require 'rails_helper'

RSpec.describe "styles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/styles", params: params
  end

  describe 'basic fetch' do
    let!(:style1) { create(:style) }
    let!(:style2) { create(:style) }

    it 'works' do
      expect(StyleResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['styles'])
      expect(d.map(&:id)).to match_array([style1.id, style2.id])
    end
  end
end
