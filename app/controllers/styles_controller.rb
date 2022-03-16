class StylesController < ApplicationController
  before_action :set_style, only: %i[show edit update destroy]

  def index
    @q = Style.ransack(params[:q])
    @styles = @q.result(distinct: true).includes(:items, :preferences,
                                                 :users).page(params[:page]).per(10)
  end

  def show
    @preference = Preference.new
    @item = Item.new
  end

  def new
    @style = Style.new
  end

  def edit; end

  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to @style, notice: "Style was successfully created."
    else
      render :new
    end
  end

  def update
    if @style.update(style_params)
      redirect_to @style, notice: "Style was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @style.destroy
    redirect_to styles_url, notice: "Style was successfully destroyed."
  end

  private

  def set_style
    @style = Style.find(params[:id])
  end

  def style_params
    params.require(:style).permit(:style_name)
  end
end
