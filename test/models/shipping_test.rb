require "test_helper"

class ShippingTest < ActiveSupport::TestCase
  test "is valid" do
    customer = Customer.create!
    shipping_data = Shipping.new(
      name: "Iris Watson",
      address: "P.O. Box 283 8562 Fusce Rd.",
      zip_code: "20620",
      customer: customer
    )

    assert shipping_data.valid?
  end
end
