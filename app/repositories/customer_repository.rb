class CustomerRepository
  def persist_new_customer_subscription(subscription:, billing:, shipping:)
    customer = Customer.new
    customer.subscriptions << subscription
    customer.billing = billing
    customer.shipping = shipping

    customer.save!
  end
end
