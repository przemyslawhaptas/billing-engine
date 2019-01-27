require "test_helper"

class BillingTest < ActiveSupport::TestCase
  test "is valid" do
    customer = Customer.create!
    billing = Billing.new(purchase_token: "aaa", customer: customer)

    assert billing.valid?
  end
end
