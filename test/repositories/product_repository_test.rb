require "test_helper"

class ProductRepositoryTest < ActiveSupport::TestCase
  test "finds a price for a given product id" do
    products = [
      Product.new(id: "bronze", price: 100, name: "Bronze Box"),
      Product.new(id: "silver", price: 200, name: "Silver Box"),
    ]
    subject = ProductRepository.new(all: products)

    price = subject.find_price("silver")

    assert_equal 200, price
  end
end
