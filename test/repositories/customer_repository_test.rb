require "test_helper"

class CustomerRepositoryTest < ActiveSupport::TestCase
  test "saves a customer" do
    customer = Customer.new
    repository = CustomerRepository.new

    when_called = -> { repository.save!(customer) }

    assert_difference -> { Customer.count }, 1, &when_called
  end
end
