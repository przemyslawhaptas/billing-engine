require "test_helper"

class ShippingTest < ActiveSupport::TestCase
  test "is valid" do
    assert Shipping.new.valid?
  end
end
