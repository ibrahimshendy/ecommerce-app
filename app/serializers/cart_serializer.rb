class CartSerializer < ActiveModel::Serializer
  attributes :id, :total, :created_at

  has_many :items

  attribute :total do
    total = 0
    @object.items.each do |item|
      total += item.product.price * item.quantity
    end
    total
  end
end
