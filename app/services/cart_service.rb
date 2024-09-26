# frozen_string_literal: true

class CartService
  def self.retrieve_cart(user)
    @cart = Cart.includes(items: :product).find_or_create_by!(user_id: user.id)
  end

  def self.update(cart_items, user)
    @cart = self.retrieve_cart(user)

    @cart.update(cart_items) ? @cart : @cart.errors.full_messages
  end
end
