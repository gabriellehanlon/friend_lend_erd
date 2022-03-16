class LetterSizesController < ApplicationController
  before_action :set_letter_size, only: %i[show edit update destroy]

  def index
    @q = LetterSize.ransack(params[:q])
    @letter_sizes = @q.result(distinct: true).includes(:preferences, :items,
                                                       :users).page(params[:page]).per(10)
  end

  def show
    @item = Item.new
    @preference = Preference.new
  end

  def new
    @letter_size = LetterSize.new
  end

  def edit; end

  def create
    @letter_size = LetterSize.new(letter_size_params)

    if @letter_size.save
      redirect_to @letter_size, notice: "Letter size was successfully created."
    else
      render :new
    end
  end

  def update
    if @letter_size.update(letter_size_params)
      redirect_to @letter_size, notice: "Letter size was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @letter_size.destroy
    redirect_to letter_sizes_url,
                notice: "Letter size was successfully destroyed."
  end

  private

  def set_letter_size
    @letter_size = LetterSize.find(params[:id])
  end

  def letter_size_params
    params.require(:letter_size).permit(:size)
  end
end
