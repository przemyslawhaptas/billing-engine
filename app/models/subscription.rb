class Subscription
  include ActiveModel::Model

  attr_accessor :product_id,
                :user_id

  validates :product_id, presence: true
end
