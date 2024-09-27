class Product < ApplicationRecord
  include ProductSearchable

  after_save :invalidate_cache

  belongs_to :category

  has_one_attached :image

  STATUSES = %w[active inactive deleted]

  validates :category, presence: true, if: :category_id
  validates :name, presence: true, length: {minimum: 3}
  validates :description, presence: false, length: { maximum: 255 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :sort, numericality: { only_integer: true, greater_than: -1 }
  validate  :valid_image

  def invalidate_cache
    Rails.cache.delete("list_of_products")
  end

  def valid_image
    return unless image.attached?

    unless image.blob.byte_size <= 1.megabyte
      errors.add(:image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, "must be a JPEG or PNG")
    end
  end
end
