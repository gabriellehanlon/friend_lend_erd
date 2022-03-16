require 'rails_helper'

RSpec.describe "styles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/styles/#{style.id}"
  end

  describe 'basic destroy' do
    let!(:style) { create(:style) }

    it 'updates the resource' do
      expect(StyleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Style.count }.by(-1)
      expect { style.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
