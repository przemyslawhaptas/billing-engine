class Subscription
  include ActiveModel::Model

  attr_accessor :product_id,
                :customer_id

  validates :product_id, presence: true
end
