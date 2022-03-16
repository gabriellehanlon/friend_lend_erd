class ClosetsController < ApplicationController
  before_action :current_user_must_be_closet_user,
                only: %i[edit update destroy]

  before_action :set_closet, only: %i[show edit update destroy]

  def index
    @q = Closet.ransack(params[:q])
    @closets = @q.result(distinct: true).includes(:user,
                                                  :items).page(params[:page]).per(10)
  end

  def show
    @item = Item.new
  end

  def new
    @closet = Closet.new
  end

  def edit; end

  def create
    @closet = Closet.new(closet_params)

    if @closet.save
      message = "Closet was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @closet, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @closet.update(closet_params)
      redirect_to @closet, notice: "Closet was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @closet.destroy
    message = "Closet was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to closets_url, notice: message
    end
  end

  private

  def current_user_must_be_closet_user
    set_closet
    unless current_user == @closet.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_closet
    @closet = Closet.find(params[:id])
  end

  def closet_params
    params.require(:closet).permit(:user_id)
  end
end
