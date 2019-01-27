require "test_helper"

class ShippingDataValidatorTest < ActiveSupport::TestCase
  test "validates" do
    shipping_data = ShippingDataValidator.new(
      name: "Iris Watson",
      address: "P.O. Box 283 8562 Fusce Rd.",
      zip_code: "20620"
    )

    assert shipping_data.valid?
  end
end
