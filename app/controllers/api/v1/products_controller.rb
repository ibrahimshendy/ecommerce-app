class Api::V1::ProductsController < Api::BaseController
  before_action :find_product, only: %i[ show update destroy]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  def index
    @products = Rails.cache.fetch("list_of_products", expires_in: 2.minutes) do
      Product.includes([:category, :image_attachment => [:blob]]).all.to_a
    end

    render json: @products
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render status: 201, json: @product
    else
      render status: 422, json: {errors: @product.errors}
    end
  end

  def update
    if @product.update(product_params)
      render status: 200, json: @product
    else
      render status: 422, json: {errors: @product.errors}
    end
  end

  def destroy
    if @product.destroy
      render status: 200, json: {message: "Product successfully deleted"}
    end
  end

  private
  def product_params
    params.require(:product).permit(:category_id, :name, :price, :quantity, :description, :image, :sort, :status)
  end

  def find_product
    unless (@product = Product.includes(:category).where(id: params[:id]).first)
      render json: {message: "Product not found"}, status: 404
    end
  end
end
