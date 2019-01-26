require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "is valid" do
    subscription_data = Subscription.new(product_id: 1)

    assert subscription_data.valid?
  end
end
