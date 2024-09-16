class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :description, :created_at

  belongs_to :category
end
