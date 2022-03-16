class Api::V1::LendTransactionsController < Api::V1::GraphitiController
  def index
    lend_transactions = LendTransactionResource.all(params)
    respond_with(lend_transactions)
  end

  def show
    lend_transaction = LendTransactionResource.find(params)
    respond_with(lend_transaction)
  end

  def create
    lend_transaction = LendTransactionResource.build(params)

    if lend_transaction.save
      render jsonapi: lend_transaction, status: :created
    else
      render jsonapi_errors: lend_transaction
    end
  end

  def update
    lend_transaction = LendTransactionResource.find(params)

    if lend_transaction.update_attributes
      render jsonapi: lend_transaction
    else
      render jsonapi_errors: lend_transaction
    end
  end

  def destroy
    lend_transaction = LendTransactionResource.find(params)

    if lend_transaction.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: lend_transaction
    end
  end
end
