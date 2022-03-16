class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).includes(:style, :closet,
                                                :lend_transactions, :saved_items, :item_type, :letter_size, :number_size, :user).page(params[:page]).per(10)
  end

  # GET /items/1
  def show
    @saved_item = SavedItem.new
    @lend_transaction = LendTransaction.new
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      message = "Item was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @item, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    message = "Item was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to items_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:closet_id, :item_name, :item_type_id,
                                 :style_id, :letter_size_id, :number_size_id, :item_description, :photos)
  end
end
