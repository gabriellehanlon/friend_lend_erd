class Api::V1::SavedItemsController < Api::V1::GraphitiController
  def index
    saved_items = SavedItemResource.all(params)
    respond_with(saved_items)
  end

  def show
    saved_item = SavedItemResource.find(params)
    respond_with(saved_item)
  end

  def create
    saved_item = SavedItemResource.build(params)

    if saved_item.save
      render jsonapi: saved_item, status: 201
    else
      render jsonapi_errors: saved_item
    end
  end

  def update
    saved_item = SavedItemResource.find(params)

    if saved_item.update_attributes
      render jsonapi: saved_item
    else
      render jsonapi_errors: saved_item
    end
  end

  def destroy
    saved_item = SavedItemResource.find(params)

    if saved_item.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: saved_item
    end
  end
end
