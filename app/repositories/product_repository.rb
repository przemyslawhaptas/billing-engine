class ProductRepository
  PRODUCTS = [
    Product.new(id: "bronze", price: 1999, name: "Bronze Box"),
    Product.new(id: "silver", price: 4900, name: "Silver Box"),
    Product.new(id: "gold", price: 9900, name: "Gold Box"),
  ]

  attr_reader :all

  def initialize(all: PRODUCTS)
    @all = all
  end

  def find_price(id)
    all
      .find { |product| product.id == id }
      &.price
  end
end
