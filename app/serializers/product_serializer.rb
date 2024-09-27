class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :image_url, :description, :created_at

  belongs_to :category
  has_one :image_attachment

  attribute :image_url do
    object.image_attachment ? object.image_attachment.url : ""
  end
end
