class Api::V1::StylesController < Api::V1::GraphitiController
  def index
    styles = StyleResource.all(params)
    respond_with(styles)
  end

  def show
    style = StyleResource.find(params)
    respond_with(style)
  end

  def create
    style = StyleResource.build(params)

    if style.save
      render jsonapi: style, status: :created
    else
      render jsonapi_errors: style
    end
  end

  def update
    style = StyleResource.find(params)

    if style.update_attributes
      render jsonapi: style
    else
      render jsonapi_errors: style
    end
  end

  def destroy
    style = StyleResource.find(params)

    if style.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: style
    end
  end
end
