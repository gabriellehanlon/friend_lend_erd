require 'rails_helper'

RSpec.describe "saved_items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/saved_items/#{saved_item.id}"
  end

  describe 'basic destroy' do
    let!(:saved_item) { create(:saved_item) }

    it 'updates the resource' do
      expect(SavedItemResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SavedItem.count }.by(-1)
      expect { saved_item.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
