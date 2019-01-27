require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "is valid" do
    customer = Customer.create!
    subscription_data = Subscription.new(product_id: "gold", customer: customer)

    assert subscription_data.valid?
  end
end
