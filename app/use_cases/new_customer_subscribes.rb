class NewCustomerSubscribes
  def initialize(
    deserializer: SubscriptionDeserializer.new,
    product_repository: ProductRepository.new,
    purchase_service: Fakeway::InitialPurchase.new,
    customer_repository: CustomerRepository.new
  )
    @deserializer = deserializer
    @product_repository = product_repository
    @purchase_service = purchase_service
    @customer_repository = customer_repository
  end

  def call(subscription_json)
    parsing_result, parsed_data = deserializer.parse(subscription_json)
    subscription = parsed_data[:subscription]
    credit_card = parsed_data[:credit_card]
    shipping = parsed_data[:shipping]
    return [:invalid_data, parsed_data[:errors]] if parsing_result == :error

    amount = product_repository.find_price(subscription.product_id)
    purchase_result, purchase_data = purchase_service.call(amount, credit_card)
    billing = purchase_data[:billing]
    return [:purchase_failed, purchase_data[:errors]] if purchase_result == :error

    customer_repository.persist_new_customer_subscription(
      subscription: subscription, billing: billing, shipping: shipping
    )

    [:ok, []]
  end

  private

  attr_reader :deserializer, :product_repository, :purchase_service, :customer_repository
end
