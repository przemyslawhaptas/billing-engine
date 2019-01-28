require "test_helper"

class BillingRepositoryTest < ActiveSupport::TestCase
  test "saves a billing" do
    customer = Customer.create!
    billing = Billing.new(customer: customer, purchase_token: "123")
    repository = BillingRepository.new

    when_called = -> { repository.save!(billing) }

    assert_difference -> { Billing.count }, 1, &when_called
  end
end
