class NumberSizesController < ApplicationController
  before_action :set_number_size, only: [:show, :edit, :update, :destroy]

  # GET /number_sizes
  def index
    @number_sizes = NumberSize.all
  end

  # GET /number_sizes/1
  def show
  end

  # GET /number_sizes/new
  def new
    @number_size = NumberSize.new
  end

  # GET /number_sizes/1/edit
  def edit
  end

  # POST /number_sizes
  def create
    @number_size = NumberSize.new(number_size_params)

    if @number_size.save
      redirect_to @number_size, notice: 'Number size was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /number_sizes/1
  def update
    if @number_size.update(number_size_params)
      redirect_to @number_size, notice: 'Number size was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /number_sizes/1
  def destroy
    @number_size.destroy
    redirect_to number_sizes_url, notice: 'Number size was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_number_size
      @number_size = NumberSize.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def number_size_params
      params.require(:number_size).permit(:size)
    end
end
