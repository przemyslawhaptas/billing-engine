require "test_helper"

class ShippingRepositoryTest < ActiveSupport::TestCase
  test "saves a shipping" do
    customer = Customer.create!
    shipping = Shipping.new(
      customer: customer,
      name: "Iris Watson",
      address: "P.O. Box 283 8562 Fusce Rd.",
      zip_code: "20620"
    )
    repository = ShippingRepository.new

    when_called = -> { repository.save!(shipping) }

    assert_difference -> { Shipping.count }, 1, &when_called
  end
end
