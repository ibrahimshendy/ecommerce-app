class Api::V1::ProductsController < ApplicationController
  def index
    render json: {data: Product.includes(:category).all }, include: [:category]
  end

  def show
    render json: {data: Product.includes(:category).find(params[:id])}, include: [:category]
  end

end
