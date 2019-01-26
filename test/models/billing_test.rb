require "test_helper"

class BillingTest < ActiveSupport::TestCase
  test "is valid" do
    assert Billing.new.valid?
  end
end
