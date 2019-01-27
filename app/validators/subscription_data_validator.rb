class SubscriptionDataValidator
  include ActiveModel::Model

  attr_accessor :product_id

  validates :product_id, inclusion: { in: Product::TYPES }
end
