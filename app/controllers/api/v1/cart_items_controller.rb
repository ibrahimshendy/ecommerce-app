class Api::V1::CartItemsController < Api::BaseController
  def index
    render json: cart.items.includes(:product), root: "items"
  end

  # POST => /api/v1/carts/items
  def create
    @cart_item = cart.items.new(cart_items_params)

    if @cart_item.save
      render json: @cart_item, status: 201
    else
      render json: @cart_item.errors.full_messages, status: 422
    end
  end

  # PUT => /api/v1/carts/items/:item_id
  def update
    @cart_item = cart.items.find(params[:id])

    if @cart_item.update(cart_items_params)
      render json: @cart_item, status: 200
    else
      render json: @cart_item.errors.full_messages, status: 422
    end
  end

  # DELETE => api/v1/carts/items/:id
  def destroy
    @cart_item = cart.items.find(params[:id])

    if @cart_item.destroy
      render json: {message: 'cart items deleted successfully'}, status: 200
    end
  end

  private
  def cart
    CartService.retrieve_cart(current_user)
  end

  def cart_items_params
    params.require(:item).permit(:product_id, :quantity)
  end
end
