require "test_helper"

class SubscriptionRepositoryTest < ActiveSupport::TestCase
  test "saves a subscription" do
    repository = SubscriptionRepository.new
    product_id = "gold"
    customer = Customer.create!
    subscription = Subscription.new(customer: customer, product_id: product_id)

    when_called = -> { repository.save!(subscription) }

    assert_difference -> { Subscription.count }, 1, &when_called
  end
end
