require "test_helper"

class CreateSubscriptionForNewUserTest < ActiveSupport::TestCase
  test "successfully purchases the product based on passed subscription params"

  test "returns erros on invalid request data" do
    subscription_json = {}
    deserializer = mock
    deserializer.expects(:parse).with(subscription_json).returns([:error, { errors: ["An error occurred"] }])
    subject = CreateSubscriptionForNewUser.new(
      deserializer: deserializer
    )

    result, errors = subject.call(subscription_json)

    assert_equal :invalid_data, result
    assert_equal ["An error occurred"], errors
  end

  test "returns errors on unsuccesful purchase" do
    subscription_json = {}
    price = 100
    deserializer = mock
    product_repository = mock
    purchase_service = mock
    subject = CreateSubscriptionForNewUser.new(
      deserializer: deserializer,
      product_repository: product_repository,
      purchase_service: purchase_service
    )
    subscription = Subscription.new
    billing = Billing.new
    shipping = Shipping.new

    deserializer
      .expects(:parse).with(subscription_json)
      .returns([:ok, { subscription: subscription, billing: billing, shipping: shipping }])
    product_repository.expects(:find_price).returns(price)
    purchase_service.expects(:call).with(price, billing).returns([:error, { errors: ["An error occurred"] }])

    result, errors = subject.call(subscription_json)

    assert_equal :purchase_failed, result
    assert_equal ["An error occurred"], errors
  end
end
