class SavedItemsController < ApplicationController
  before_action :current_user_must_be_saved_item_user,
                only: %i[edit update destroy]

  before_action :set_saved_item, only: %i[show edit update destroy]

  def index
    @q = current_user.saved_items.ransack(params[:q])
    @saved_items = @q.result(distinct: true).includes(:user,
                                                      :item).page(params[:page]).per(10)
  end

  def show; end

  def new
    @saved_item = SavedItem.new
  end

  def edit; end

  def create
    @saved_item = SavedItem.new(saved_item_params)

    if @saved_item.save
      message = "SavedItem was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @saved_item, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @saved_item.update(saved_item_params)
      redirect_to @saved_item, notice: "Saved item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @saved_item.destroy
    message = "SavedItem was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to saved_items_url, notice: message
    end
  end

  private

  def current_user_must_be_saved_item_user
    set_saved_item
    unless current_user == @saved_item.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_saved_item
    @saved_item = SavedItem.find(params[:id])
  end

  def saved_item_params
    params.require(:saved_item).permit(:item_id, :user_id)
  end
end
