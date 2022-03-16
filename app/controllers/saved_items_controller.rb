class SavedItemsController < ApplicationController
  before_action :set_saved_item, only: [:show, :edit, :update, :destroy]

  # GET /saved_items
  def index
    @saved_items = SavedItem.all
  end

  # GET /saved_items/1
  def show
  end

  # GET /saved_items/new
  def new
    @saved_item = SavedItem.new
  end

  # GET /saved_items/1/edit
  def edit
  end

  # POST /saved_items
  def create
    @saved_item = SavedItem.new(saved_item_params)

    if @saved_item.save
      redirect_to @saved_item, notice: 'Saved item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /saved_items/1
  def update
    if @saved_item.update(saved_item_params)
      redirect_to @saved_item, notice: 'Saved item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /saved_items/1
  def destroy
    @saved_item.destroy
    redirect_to saved_items_url, notice: 'Saved item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_item
      @saved_item = SavedItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def saved_item_params
      params.require(:saved_item).permit(:item_id, :user_id)
    end
end
