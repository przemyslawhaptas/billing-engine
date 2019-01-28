require "test_helper"

class SchedulerRunsBillingTest < ActiveSupport::TestCase
  test "calls purchase service for each subscription with current billing day" do
    gold_product_price = 2_000
    silver_product_price = 1_000
    customer1 = Customer.create!
    customer1_billing = Billing.create!(purchase_token: "token1", customer: customer1)
    Subscription.create!(customer: customer1, product_id: "gold", created_at: DateTime.new(2018, 3, 28))
    Subscription.create!(customer: customer1, product_id: "gold", created_at: DateTime.new(2018, 5, 15))
    customer2 = Customer.create!
    customer2_billing = Billing.create!(purchase_token: "token2", customer: customer2)
    Subscription.create!(customer: customer2, product_id: "silver", created_at: DateTime.new(2018, 7, 31))
    today = Date.new(2018, 10, 28)
    product_repository = mock("product_repository")
    purchase_service = mock("purchase_service")

    product_repository.stubs(:find_price).with("gold").returns(gold_product_price)
    product_repository.stubs(:find_price).with("silver").returns(silver_product_price)
    purchase_service.expects(:call).with(gold_product_price, customer1_billing).returns([:ok, mock])
    purchase_service.expects(:call).with(silver_product_price, customer2_billing).returns([:ok, mock])

    result = SchedulerRunsBilling.new(
      product_repository: product_repository, purchase_service: purchase_service
    ).call(today)

    assert_equal %i[ok ok], result.map(&:first)
  end
end
