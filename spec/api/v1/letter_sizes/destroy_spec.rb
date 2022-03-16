require 'rails_helper'

RSpec.describe "letter_sizes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/letter_sizes/#{letter_size.id}"
  end

  describe 'basic destroy' do
    let!(:letter_size) { create(:letter_size) }

    it 'updates the resource' do
      expect(LetterSizeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { LetterSize.count }.by(-1)
      expect { letter_size.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
