class Subscription < ApplicationRecord
  belongs_to :customer

  attr_accessor :product_id

  validates :product_id, inclusion: { in: Product::TYPES }
end
