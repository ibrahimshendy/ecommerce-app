class Product < ApplicationRecord
  after_save :invalidate_cache

  belongs_to :category

  STATUSES = %w[active inactive deleted]

  validates :category, presence: true, if: :category_id
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: false, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :sort, numericality: { only_integer: true, greater_than: -1 }


  def invalidate_cache
    Rails.cache.delete("list_of_products")
  end
end
