require 'rails_helper'

RSpec.describe LendTransactionResource, type: :resource do
  describe 'serialization' do
    let!(:lend_transaction) { create(:lend_transaction) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(lend_transaction.id)
      expect(data.jsonapi_type).to eq('lend_transactions')
    end
  end

  describe 'filtering' do
    let!(:lend_transaction1) { create(:lend_transaction) }
    let!(:lend_transaction2) { create(:lend_transaction) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: lend_transaction2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([lend_transaction2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:lend_transaction1) { create(:lend_transaction) }
      let!(:lend_transaction2) { create(:lend_transaction) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            lend_transaction1.id,
            lend_transaction2.id
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
            lend_transaction2.id,
            lend_transaction1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
