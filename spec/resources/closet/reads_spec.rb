require 'rails_helper'

RSpec.describe ClosetResource, type: :resource do
  describe 'serialization' do
    let!(:closet) { create(:closet) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(closet.id)
      expect(data.jsonapi_type).to eq('closets')
    end
  end

  describe 'filtering' do
    let!(:closet1) { create(:closet) }
    let!(:closet2) { create(:closet) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: closet2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([closet2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:closet1) { create(:closet) }
      let!(:closet2) { create(:closet) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            closet1.id,
            closet2.id
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
            closet2.id,
            closet1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
