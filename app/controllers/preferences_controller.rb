class PreferencesController < ApplicationController
  before_action :current_user_must_be_preference_user, only: [:edit, :update, :destroy] 

  before_action :set_preference, only: [:show, :edit, :update, :destroy]

  # GET /preferences
  def index
    @preferences = current_user.preferences.page(params[:page]).per(10)
  end

  # GET /preferences/1
  def show
  end

  # GET /preferences/new
  def new
    @preference = Preference.new
  end

  # GET /preferences/1/edit
  def edit
  end

  # POST /preferences
  def create
    @preference = Preference.new(preference_params)

    if @preference.save
      message = 'Preference was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @preference, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /preferences/1
  def update
    if @preference.update(preference_params)
      redirect_to @preference, notice: 'Preference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /preferences/1
  def destroy
    @preference.destroy
    message = "Preference was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to preferences_url, notice: message
    end
  end


  private

  def current_user_must_be_preference_user
    set_preference
    unless current_user == @preference.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_preference
      @preference = Preference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def preference_params
      params.require(:preference).permit(:user_id, :number_size_id, :letter_size_id, :style_id)
    end
end
