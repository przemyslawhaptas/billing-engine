require "test_helper"

class SubscriptionDataValidatorTest < ActiveSupport::TestCase
  test "is valid" do
    subscription_data = SubscriptionDataValidator.new(product_id: "gold")

    assert subscription_data.valid?
  end
end
