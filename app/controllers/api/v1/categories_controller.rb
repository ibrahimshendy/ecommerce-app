class Api::V1::CategoriesController < Api::BaseController
  before_action :set_category, only: %i[ show update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  # GET /api/v1/categories
  def index
    render json: CategoryService.api_filter(params[:category])
  end

  # GET /api/v1/categories/1
  def show
    render json: @category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render status: 201, json: @category
    else
      render status: 422, json: {
        errors: @category.errors
      }
    end
  end

  # PATCH/PUT /api/v1/categories/{id}
  def update
      if @category.update(category_params)
        render json: @category
      else
        render status: 400, json: {
          errors: @category.errors
        }
      end
  end

  # DELETE /categories/{id}
  def destroy
    @category.destroy!

    render json: {message: "Category successfully destroyed" }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    unless (@category = Category.where(id: params[:id]).first)
      render status: 404, json: {
        message: "This category not found"
      }
    end
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :slug, :description, :status, :sort)
  end
end
