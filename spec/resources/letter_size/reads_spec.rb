require 'rails_helper'

RSpec.describe LetterSizeResource, type: :resource do
  describe 'serialization' do
    let!(:letter_size) { create(:letter_size) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(letter_size.id)
      expect(data.jsonapi_type).to eq('letter_sizes')
    end
  end

  describe 'filtering' do
    let!(:letter_size1) { create(:letter_size) }
    let!(:letter_size2) { create(:letter_size) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: letter_size2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([letter_size2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:letter_size1) { create(:letter_size) }
      let!(:letter_size2) { create(:letter_size) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            letter_size1.id,
            letter_size2.id
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
            letter_size2.id,
            letter_size1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
