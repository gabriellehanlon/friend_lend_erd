class Api::V1::NumberSizesController < Api::V1::GraphitiController
  def index
    number_sizes = NumberSizeResource.all(params)
    respond_with(number_sizes)
  end

  def show
    number_size = NumberSizeResource.find(params)
    respond_with(number_size)
  end

  def create
    number_size = NumberSizeResource.build(params)

    if number_size.save
      render jsonapi: number_size, status: 201
    else
      render jsonapi_errors: number_size
    end
  end

  def update
    number_size = NumberSizeResource.find(params)

    if number_size.update_attributes
      render jsonapi: number_size
    else
      render jsonapi_errors: number_size
    end
  end

  def destroy
    number_size = NumberSizeResource.find(params)

    if number_size.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: number_size
    end
  end
end
