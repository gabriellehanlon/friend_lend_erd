require 'rails_helper'

RSpec.describe PreferenceResource, type: :resource do
  describe 'serialization' do
    let!(:preference) { create(:preference) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(preference.id)
      expect(data.jsonapi_type).to eq('preferences')
    end
  end

  describe 'filtering' do
    let!(:preference1) { create(:preference) }
    let!(:preference2) { create(:preference) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: preference2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([preference2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:preference1) { create(:preference) }
      let!(:preference2) { create(:preference) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            preference1.id,
            preference2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            preference2.id,
            preference1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
