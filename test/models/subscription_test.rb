require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "is valid" do
    assert Subscription.new.valid?
  end
end
