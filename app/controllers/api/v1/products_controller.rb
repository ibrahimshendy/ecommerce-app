class Api::V1::ProductsController < ApplicationController
  before_action :find_product, only: %i[ show update destroy]
  def index
    render json: {data: Product.includes(:category).all }, include: [:category]
  end

  def show
    render json: {data: @product}, include: [:category]
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render status: 201, json: {data: @product}
    else
      render status: 422, json: {errors: @product.errors}
    end
  end

  def update
    @product = Product.new(product_params)

    if @product.save
      render status: 200, json: {data: @product}
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
    params.require(:product).permit(:category_id, :name, :price, :quantity, :description, :sort, :status)
  end

  def find_product
    unless (@product = Product.includes(:category).where(id: params[:id]).first)
      render json: {message: "Product not found"}, status: 404
    end
  end
end
