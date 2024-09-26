class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :product, presence: true, if: :product_id, uniqueness: { scope: :cart_id }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
