require "test_helper"

class ExistingCustomerSubscribesTest < ActiveSupport::TestCase
  test "is not implemented" do
    subscription_json = {}
    subject = ExistingCustomerSubscribes.new

    result, data = subject.call(subscription_json)

    assert_equal :invalid_data, result
    assert_equal ["Purchases for existing customers are not implemented"], data
  end
end
