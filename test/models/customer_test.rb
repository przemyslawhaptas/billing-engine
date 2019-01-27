require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "is valid" do
    customer = Customer.new

    assert customer.valid?
  end
end
