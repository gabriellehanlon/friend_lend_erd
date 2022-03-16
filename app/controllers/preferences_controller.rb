class PreferencesController < ApplicationController
  before_action :current_user_must_be_preference_user,
                only: %i[edit update destroy]

  before_action :set_preference, only: %i[show edit update destroy]

  def index
    @q = current_user.preferences.ransack(params[:q])
    @preferences = @q.result(distinct: true).includes(:user, :style,
                                                      :letter_size, :number_size).page(params[:page]).per(10)
  end

  def show; end

  def new
    @preference = Preference.new
  end

  def edit; end

  def create
    @preference = Preference.new(preference_params)

    if @preference.save
      message = "Preference was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @preference, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @preference.update(preference_params)
      redirect_to @preference, notice: "Preference was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @preference.destroy
    message = "Preference was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to preferences_url, notice: message
    end
  end

  private

  def current_user_must_be_preference_user
    set_preference
    unless current_user == @preference.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_preference
    @preference = Preference.find(params[:id])
  end

  def preference_params
    params.require(:preference).permit(:user_id, :number_size_id,
                                       :letter_size_id, :style_id)
  end
end
