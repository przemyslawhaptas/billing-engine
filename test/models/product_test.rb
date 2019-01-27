require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "is valid" do
    product = Product.new(id: "gold", price: 4999, name: "One Box")

    assert product.valid?
  end
end
