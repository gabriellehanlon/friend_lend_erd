class ItemTypesController < ApplicationController
  before_action :set_item_type, only: [:show, :edit, :update, :destroy]

  # GET /item_types
  def index
    @item_types = ItemType.page(params[:page]).per(10)
  end

  # GET /item_types/1
  def show
    @item = Item.new
  end

  # GET /item_types/new
  def new
    @item_type = ItemType.new
  end

  # GET /item_types/1/edit
  def edit
  end

  # POST /item_types
  def create
    @item_type = ItemType.new(item_type_params)

    if @item_type.save
      redirect_to @item_type, notice: 'Item type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /item_types/1
  def update
    if @item_type.update(item_type_params)
      redirect_to @item_type, notice: 'Item type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /item_types/1
  def destroy
    @item_type.destroy
    redirect_to item_types_url, notice: 'Item type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_type
      @item_type = ItemType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_type_params
      params.require(:item_type).permit(:name)
    end
end
