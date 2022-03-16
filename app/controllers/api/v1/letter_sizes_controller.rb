class Api::V1::LetterSizesController < Api::V1::GraphitiController
  def index
    letter_sizes = LetterSizeResource.all(params)
    respond_with(letter_sizes)
  end

  def show
    letter_size = LetterSizeResource.find(params)
    respond_with(letter_size)
  end

  def create
    letter_size = LetterSizeResource.build(params)

    if letter_size.save
      render jsonapi: letter_size, status: :created
    else
      render jsonapi_errors: letter_size
    end
  end

  def update
    letter_size = LetterSizeResource.find(params)

    if letter_size.update_attributes
      render jsonapi: letter_size
    else
      render jsonapi_errors: letter_size
    end
  end

  def destroy
    letter_size = LetterSizeResource.find(params)

    if letter_size.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: letter_size
    end
  end
end
