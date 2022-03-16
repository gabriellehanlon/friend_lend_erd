require 'rails_helper'

RSpec.describe LendTransactionResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'lend_transactions',
          attributes: { }
        }
      }
    end

    let(:instance) do
      LendTransactionResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { LendTransaction.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:lend_transaction) { create(:lend_transaction) }

    let(:payload) do
      {
        data: {
          id: lend_transaction.id.to_s,
          type: 'lend_transactions',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      LendTransactionResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { lend_transaction.reload.updated_at }
      # .and change { lend_transaction.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:lend_transaction) { create(:lend_transaction) }

    let(:instance) do
      LendTransactionResource.find(id: lend_transaction.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { LendTransaction.count }.by(-1)
    end
  end
end
