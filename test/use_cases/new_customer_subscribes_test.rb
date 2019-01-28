require "test_helper"

class NewCustomerSubscribesTest < ActiveSupport::TestCase
  test "returns erros on invalid request data" do
    subscription_json = {}
    deserializer = mock
    deserializer.expects(:parse).with(subscription_json).returns([:error, { errors: ["An error occurred"] }])
    subject = NewCustomerSubscribes.new(
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
    subject = NewCustomerSubscribes.new(
      deserializer: deserializer,
      product_repository: product_repository,
      purchase_service: purchase_service
    )
    subscription = Subscription.new
    credit_card = CreditCard.new
    shipping = Shipping.new

    deserializer
      .expects(:parse).with(subscription_json)
      .returns([:ok, { subscription: subscription, credit_card: credit_card, shipping: shipping }])
    product_repository.expects(:find_price).returns(price)
    purchase_service.expects(:call).with(price, credit_card).returns([:error, { errors: ["An error occurred"] }])

    result, errors = subject.call(subscription_json)

    assert_equal :purchase_failed, result
    assert_equal ["An error occurred"], errors
  end

  test "successfully purchases the product based on passed subscription params" do
    subscription_json = {}
    price = 100
    deserializer = mock
    product_repository = mock
    purchase_service = mock
    persist_results = mock
    subject = NewCustomerSubscribes.new(
      deserializer: deserializer,
      product_repository: product_repository,
      purchase_service: purchase_service,
      persist_results: persist_results
    )
    subscription = Subscription.new
    credit_card = CreditCard.new
    shipping = Shipping.new
    billing = Billing.new

    deserializer
      .expects(:parse).with(subscription_json)
      .returns([:ok, { subscription: subscription, credit_card: credit_card, shipping: shipping }])
    product_repository.expects(:find_price).returns(price)
    purchase_service.expects(:call).with(price, credit_card).returns([:ok, { billing: billing }])
    persist_results.expects(:call).with(subscription: subscription, billing: billing, shipping: shipping)

    result, _data = subject.call(subscription_json)

    assert_equal :ok, result
  end
end
