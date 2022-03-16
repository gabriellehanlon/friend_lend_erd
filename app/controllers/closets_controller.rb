class ClosetsController < ApplicationController
  before_action :set_closet, only: [:show, :edit, :update, :destroy]

  # GET /closets
  def index
    @closets = Closet.all
  end

  # GET /closets/1
  def show
  end

  # GET /closets/new
  def new
    @closet = Closet.new
  end

  # GET /closets/1/edit
  def edit
  end

  # POST /closets
  def create
    @closet = Closet.new(closet_params)

    if @closet.save
      redirect_to @closet, notice: 'Closet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /closets/1
  def update
    if @closet.update(closet_params)
      redirect_to @closet, notice: 'Closet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /closets/1
  def destroy
    @closet.destroy
    redirect_to closets_url, notice: 'Closet was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_closet
      @closet = Closet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def closet_params
      params.require(:closet).permit(:user_id)
    end
end
