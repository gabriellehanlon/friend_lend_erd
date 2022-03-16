class LendTransactionsController < ApplicationController
  before_action :set_lend_transaction, only: [:show, :edit, :update, :destroy]

  # GET /lend_transactions
  def index
    @lend_transactions = LendTransaction.all
  end

  # GET /lend_transactions/1
  def show
  end

  # GET /lend_transactions/new
  def new
    @lend_transaction = LendTransaction.new
  end

  # GET /lend_transactions/1/edit
  def edit
  end

  # POST /lend_transactions
  def create
    @lend_transaction = LendTransaction.new(lend_transaction_params)

    if @lend_transaction.save
      redirect_to @lend_transaction, notice: 'Lend transaction was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lend_transactions/1
  def update
    if @lend_transaction.update(lend_transaction_params)
      redirect_to @lend_transaction, notice: 'Lend transaction was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lend_transactions/1
  def destroy
    @lend_transaction.destroy
    message = "LendTransaction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to lend_transactions_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lend_transaction
      @lend_transaction = LendTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lend_transaction_params
      params.require(:lend_transaction).permit(:lender_id, :user_lending_id, :pickup_date_time, :rental_period, :item_id, :chat_history)
    end
end
