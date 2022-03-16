class LendTransactionsController < ApplicationController
  before_action :current_user_must_be_lend_transaction_user_lending,
                only: %i[edit update destroy]

  before_action :current_user_must_be_lend_transaction_lender,
                only: %i[edit update destroy]

  before_action :set_lend_transaction, only: %i[show edit update destroy]

  def index
    @q = current_user.items_borrowed.ransack(params[:q])
    @lend_transactions = @q.result(distinct: true).includes(:lender,
                                                            :user_lending, :item).page(params[:page]).per(10)
  end

  def show; end

  def new
    @lend_transaction = LendTransaction.new
  end

  def edit; end

  def create
    @lend_transaction = LendTransaction.new(lend_transaction_params)

    if @lend_transaction.save
      message = "LendTransaction was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @lend_transaction, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @lend_transaction.update(lend_transaction_params)
      redirect_to @lend_transaction,
                  notice: "Lend transaction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @lend_transaction.destroy
    message = "LendTransaction was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to lend_transactions_url, notice: message
    end
  end

  private

  def current_user_must_be_lend_transaction_user_lending
    set_lend_transaction
    unless current_user == @lend_transaction.user_lending
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def current_user_must_be_lend_transaction_lender
    set_lend_transaction
    unless current_user == @lend_transaction.lender
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_lend_transaction
    @lend_transaction = LendTransaction.find(params[:id])
  end

  def lend_transaction_params
    params.require(:lend_transaction).permit(:lender_id, :user_lending_id,
                                             :pickup_date_time, :rental_period, :item_id, :chat_history)
  end
end
