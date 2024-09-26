# frozen_string_literal: true

class CartItemSerializer < ActiveModel::Serializer
  type 'items'

  attributes :id, :product_id, :price, :quantity, :created_at

  # belongs_to :product
  has_one :product

  attribute :price do
    @object.product.price
  end
end
