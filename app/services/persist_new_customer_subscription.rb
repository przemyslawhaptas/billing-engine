class PersistNewCustomerSubscription
  def initialize(customer_repository: CustomerRepository.new)
    @customer_repository = customer_repository
  end

  def call(subscription:, billing:, shipping:)
    customer = Customer.new
    customer.subscriptions << subscription
    customer.billing = billing
    customer.shipping = shipping

    customer_repository.save!(customer)
  end

  private

  attr_reader :customer_repository
end
