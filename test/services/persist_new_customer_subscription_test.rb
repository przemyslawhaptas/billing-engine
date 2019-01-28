require "test_helper"

class PersistNewCustomerSubscriptionTest < ActiveSupport::TestCase
  test "persists new Customer, Subscription, Shipping and Billing records" do
    subject = PersistNewCustomerSubscription.new
    subscription = Subscription.new(product_id: "gold")
    shipping = Shipping.new(
      name: "Iris Watson",
      address: "P.O. Box 283 8562 Fusce Rd.",
      zip_code: "20620"
    )
    billing = Billing.new(purchase_token: "123")

    when_called = -> { subject.call(subscription: subscription, billing: billing, shipping: shipping) }

    assert_difference ["Customer.count", "Subscription.count", "Shipping.count", "Billing.count"], 1, &when_called
  end
end
