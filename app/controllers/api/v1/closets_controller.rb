class Api::V1::ClosetsController < Api::V1::GraphitiController
  def index
    closets = ClosetResource.all(params)
    respond_with(closets)
  end

  def show
    closet = ClosetResource.find(params)
    respond_with(closet)
  end

  def create
    closet = ClosetResource.build(params)

    if closet.save
      render jsonapi: closet, status: 201
    else
      render jsonapi_errors: closet
    end
  end

  def update
    closet = ClosetResource.find(params)

    if closet.update_attributes
      render jsonapi: closet
    else
      render jsonapi_errors: closet
    end
  end

  def destroy
    closet = ClosetResource.find(params)

    if closet.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: closet
    end
  end
end
