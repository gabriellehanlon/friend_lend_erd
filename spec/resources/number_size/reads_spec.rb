require 'rails_helper'

RSpec.describe NumberSizeResource, type: :resource do
  describe 'serialization' do
    let!(:number_size) { create(:number_size) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(number_size.id)
      expect(data.jsonapi_type).to eq('number_sizes')
    end
  end

  describe 'filtering' do
    let!(:number_size1) { create(:number_size) }
    let!(:number_size2) { create(:number_size) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: number_size2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([number_size2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:number_size1) { create(:number_size) }
      let!(:number_size2) { create(:number_size) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            number_size1.id,
            number_size2.id
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
            number_size2.id,
            number_size1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
