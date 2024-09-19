class Category < ApplicationRecord
  include CategorySearchable
  has_many :products

  STATUSES = %w[active inactive deleted]

  validates :name, presence: true, length: { minimum: 3 }
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z0-9-]+\z/ }
  validates :description, presence: false
  validates :status, inclusion: { in: STATUSES }
  validates :sort, numericality: { only_integer: true, greater_than: -1 }

  scope :active, -> { where(status: %w[active]) }
  scope :sorted, -> { order(:sort => :asc) }

end
