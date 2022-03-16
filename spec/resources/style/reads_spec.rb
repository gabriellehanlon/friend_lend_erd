require 'rails_helper'

RSpec.describe StyleResource, type: :resource do
  describe 'serialization' do
    let!(:style) { create(:style) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(style.id)
      expect(data.jsonapi_type).to eq('styles')
    end
  end

  describe 'filtering' do
    let!(:style1) { create(:style) }
    let!(:style2) { create(:style) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: style2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([style2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:style1) { create(:style) }
      let!(:style2) { create(:style) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            style1.id,
            style2.id
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
            style2.id,
            style1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
