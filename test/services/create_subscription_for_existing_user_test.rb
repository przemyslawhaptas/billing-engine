require "test_helper"

class CreateSubscriptionForExistingUserTest < ActiveSupport::TestCase
  test "deserializes received json" do
    subscription_json = {}
    subject = CreateSubscriptionForExistingUser.new

    result, data = subject.call(subscription_json)

    assert_equal :invalid_data, result
    assert_equal ["Purchases for existing users are not implemented"], data
  end
end
