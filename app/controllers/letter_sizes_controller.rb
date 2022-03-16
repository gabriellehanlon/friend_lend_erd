class LetterSizesController < ApplicationController
  before_action :set_letter_size, only: [:show, :edit, :update, :destroy]

  # GET /letter_sizes
  def index
    @letter_sizes = LetterSize.all
  end

  # GET /letter_sizes/1
  def show
    @item = Item.new
    @preference = Preference.new
  end

  # GET /letter_sizes/new
  def new
    @letter_size = LetterSize.new
  end

  # GET /letter_sizes/1/edit
  def edit
  end

  # POST /letter_sizes
  def create
    @letter_size = LetterSize.new(letter_size_params)

    if @letter_size.save
      redirect_to @letter_size, notice: 'Letter size was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /letter_sizes/1
  def update
    if @letter_size.update(letter_size_params)
      redirect_to @letter_size, notice: 'Letter size was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /letter_sizes/1
  def destroy
    @letter_size.destroy
    redirect_to letter_sizes_url, notice: 'Letter size was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter_size
      @letter_size = LetterSize.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def letter_size_params
      params.require(:letter_size).permit(:size)
    end
end
