class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :sort, :description, :created_at
end
