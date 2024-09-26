class Api::V1::CartsController < ApplicationController

  def index
    render json: cart, include: ['items.product']
  end

  # PUT => api/v1/carts
  def update
    render json: CartService.update(cart_params, current_user)
  end

  # DELETE => api/v1/carts
  # To delete all cart items
  def destroy
    if cart.destroy
      render json: {message: 'Your cart was empty now.'}, status: 200
    end
  end

  private
  def cart
    CartService.retrieve_cart(current_user)
  end

  def cart_params
    params.require(:cart).permit(items_attributes: [:id, :product_id, :quantity, :_destroy])
  end
end
