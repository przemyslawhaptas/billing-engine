require "test_helper"

class CustomerRepositoryTest < ActiveSupport::TestCase
  test "persists new Customer, Subscription, Shipping and Billing records" do
    repository = CustomerRepository.new
    subscription = Subscription.new(product_id: "gold")
    shipping = Shipping.new(
      name: "Iris Watson",
      address: "P.O. Box 283 8562 Fusce Rd.",
      zip_code: "20620"
    )
    billing = Billing.new(purchase_token: "123")

    when_called = lambda {
      repository.persist_new_customer_subscription(
        subscription: subscription, billing: billing, shipping: shipping
      )
    }

    differences = ["Customer.count", "Subscription.count", "Shipping.count", "Billing.count"]
    assert_difference differences, 1, &when_called
  end
end
