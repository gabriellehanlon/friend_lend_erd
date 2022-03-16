class NumberSizesController < ApplicationController
  before_action :set_number_size, only: %i[show edit update destroy]

  def index
    @q = NumberSize.ransack(params[:q])
    @number_sizes = @q.result(distinct: true).includes(:preferences, :items,
                                                       :users).page(params[:page]).per(10)
  end

  def show
    @item = Item.new
    @preference = Preference.new
  end

  def new
    @number_size = NumberSize.new
  end

  def edit; end

  def create
    @number_size = NumberSize.new(number_size_params)

    if @number_size.save
      redirect_to @number_size, notice: "Number size was successfully created."
    else
      render :new
    end
  end

  def update
    if @number_size.update(number_size_params)
      redirect_to @number_size, notice: "Number size was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @number_size.destroy
    redirect_to number_sizes_url,
                notice: "Number size was successfully destroyed."
  end

  private

  def set_number_size
    @number_size = NumberSize.find(params[:id])
  end

  def number_size_params
    params.require(:number_size).permit(:size)
  end
end
