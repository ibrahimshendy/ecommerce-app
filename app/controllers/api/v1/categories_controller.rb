class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /categories or /categories.json
  def index
    render json: {
      data: Category.active.sorted.all
    }
  end

  # GET /categories/1 or /categories/1.json
  def show
    render json: {
      data: @category
    }
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render status: 201, json: {
        data: @category,
      }
    else
      render status: 422, json: {
        errors: @category.errors
      }
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
      if @category.update(category_params)
        render json: { data: @category }
      else
        render status: 400, json: {
          errors: @category.errors
        }
      end
  end

  # DELETE /categories/1 or /categories/1.json
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
