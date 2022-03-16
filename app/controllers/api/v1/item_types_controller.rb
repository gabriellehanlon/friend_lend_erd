class Api::V1::ItemTypesController < Api::V1::GraphitiController
  def index
    item_types = ItemTypeResource.all(params)
    respond_with(item_types)
  end

  def show
    item_type = ItemTypeResource.find(params)
    respond_with(item_type)
  end

  def create
    item_type = ItemTypeResource.build(params)

    if item_type.save
      render jsonapi: item_type, status: :created
    else
      render jsonapi_errors: item_type
    end
  end

  def update
    item_type = ItemTypeResource.find(params)

    if item_type.update_attributes
      render jsonapi: item_type
    else
      render jsonapi_errors: item_type
    end
  end

  def destroy
    item_type = ItemTypeResource.find(params)

    if item_type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: item_type
    end
  end
end
