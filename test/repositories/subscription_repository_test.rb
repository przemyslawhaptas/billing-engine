require "test_helper"

class SubscriptionRepositoryTest < ActiveSupport::TestCase
  test "finds subscriptions with a given billing day" do
    repository = SubscriptionRepository.new
    customer = Customer.create!
    subscription1 = Subscription.create!(
      customer: customer, product_id: "bronze", created_at: DateTime.new(2018, 3, 27)
    )
    subscription2 = Subscription.create!(
      customer: customer, product_id: "silver", created_at: DateTime.new(2018, 5, 28)
    )
    subscription3 = Subscription.create!(
      customer: customer, product_id: "gold", created_at: DateTime.new(2018, 7, 31)
    )

    on_twenty_seventh = repository.where_billing_day(Date.new(2018, 10, 27))
    on_twenty_eighth = repository.where_billing_day(Date.new(2018, 10, 28))
    on_thirty_first = repository.where_billing_day(Date.new(2018, 10, 31))

    assert_equal [subscription1], on_twenty_seventh
    assert_equal [subscription2, subscription3], on_twenty_eighth
    assert_equal [], on_thirty_first
  end
end
