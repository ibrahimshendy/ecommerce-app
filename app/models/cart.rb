class Cart < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: "CartItem", dependent: :destroy, inverse_of: :cart

  validates :user_id, presence: true, on: :create
  accepts_nested_attributes_for :items, allow_destroy: true
end
