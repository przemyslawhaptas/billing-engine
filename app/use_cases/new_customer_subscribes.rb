class NewCustomerSubscribes
  def initialize(
    deserializer: SubscriptionDeserializer.new,
    product_repository: ProductRepository.new,
    purchase_service: Fakeway::InitialPurchase.new
  )
    @deserializer = deserializer
    @product_repository = product_repository
    @purchase_service = purchase_service
  end

  def call(subscription_json)
    parsing_result, parsed_data = deserializer.parse(subscription_json)
    return [:invalid_data, parsed_data[:errors]] if parsing_result == :error

    subscription = parsed_data[:subscription]
    credit_card = parsed_data[:credit_card]

    amount = product_repository.find_price(subscription.product_id)
    purchase_result, purchase_data = purchase_service.call(amount, credit_card)
    return [:purchase_failed, purchase_data[:errors]] if purchase_result == :error

    # purchase_token = purchase_data[:token]

    # create a new customer, save the token, save the shipping and billing info
    # return success

    [:ok, nil]
  end

  private

  attr_reader :deserializer, :product_repository, :purchase_service
end
