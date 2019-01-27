require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "is valid" do
    product = Product.new(id: "1", price: 4999, name: "One Box")

    assert product.valid?
  end
end
