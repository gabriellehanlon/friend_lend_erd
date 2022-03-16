class StylesController < ApplicationController
  before_action :set_style, only: [:show, :edit, :update, :destroy]

  # GET /styles
  def index
    @q = Style.ransack(params[:q])
    @styles = @q.result(:distinct => true).includes(:items, :preferences, :users).page(params[:page]).per(10)
  end

  # GET /styles/1
  def show
    @preference = Preference.new
    @item = Item.new
  end

  # GET /styles/new
  def new
    @style = Style.new
  end

  # GET /styles/1/edit
  def edit
  end

  # POST /styles
  def create
    @style = Style.new(style_params)

    if @style.save
      redirect_to @style, notice: 'Style was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /styles/1
  def update
    if @style.update(style_params)
      redirect_to @style, notice: 'Style was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /styles/1
  def destroy
    @style.destroy
    redirect_to styles_url, notice: 'Style was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_style
      @style = Style.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def style_params
      params.require(:style).permit(:style_name)
    end
end
