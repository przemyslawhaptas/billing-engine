require "test_helper"

class CreateSubscriptionTest < ActiveSupport::TestCase
  test "deserializes received json" do
    subscription_json = {}
    deserializer = mock
    subject = CreateSubscription.new(deserializer: deserializer)
    deserializer.expects(:parse).once

    subject.call(subscription_json)
  end
end
