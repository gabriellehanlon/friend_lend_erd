class Api::V1::PreferencesController < Api::V1::GraphitiController
  def index
    preferences = PreferenceResource.all(params)
    respond_with(preferences)
  end

  def show
    preference = PreferenceResource.find(params)
    respond_with(preference)
  end

  def create
    preference = PreferenceResource.build(params)

    if preference.save
      render jsonapi: preference, status: :created
    else
      render jsonapi_errors: preference
    end
  end

  def update
    preference = PreferenceResource.find(params)

    if preference.update_attributes
      render jsonapi: preference
    else
      render jsonapi_errors: preference
    end
  end

  def destroy
    preference = PreferenceResource.find(params)

    if preference.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: preference
    end
  end
end
