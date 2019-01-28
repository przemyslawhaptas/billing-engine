class Subscription < ApplicationRecord
  belongs_to :customer

  validates :product_id, inclusion: { in: Product::TYPES }
end
