class Category < ApplicationRecord

  STATUSES = %w[active inactive deleted]

  validates :name, presence: true, length: { minimum: 3 }
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z0-9-]+\z/ }
  validates :description, presence: false
  validates :status, inclusion: { in: STATUSES }
end
