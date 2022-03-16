class LendTransactionsController < ApplicationController
  before_action :current_user_must_be_lend_transaction_user_lending, only: [:edit, :update, :destroy] 

  before_action :current_user_must_be_lend_transaction_lender, only: [:edit, :update, :destroy] 

  before_action :set_lend_transaction, only: [:show, :edit, :update, :destroy]

  # GET /lend_transactions
  def index
    @q = current_user.items_borrowed.ransack(params[:q])
    @lend_transactions = @q.result(:distinct => true).includes(:lender, :user_lending, :item).page(params[:page]).per(10)
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
      message = 'LendTransaction was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @lend_transaction, notice: message
      end
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

  def current_user_must_be_lend_transaction_user_lending
    set_lend_transaction
    unless current_user == @lend_transaction.user_lending
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end


  def current_user_must_be_lend_transaction_lender
    set_lend_transaction
    unless current_user == @lend_transaction.lender
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_lend_transaction
      @lend_transaction = LendTransaction.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lend_transaction_params
      params.require(:lend_transaction).permit(:lender_id, :user_lending_id, :pickup_date_time, :rental_period, :item_id, :chat_history)
    end
end
