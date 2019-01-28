class SubscriptionDeserializer
  include ActiveModelSerializers::Deserialization

  def parse(json)
    parsed_data = jsonapi_parse(json)
    subscription_data = parsed_data.except(:shipping, :credit_card, :customer_id)
    shipping_data = parsed_data[:shipping]
    credit_card_data = parsed_data[:credit_card]

    is_valid, errors = validate(subscription_data, shipping_data, credit_card_data)
    return [:error, { errors: errors }] unless is_valid

    [:ok, build_models(subscription_data, shipping_data, credit_card_data)]
  end

  private

  def validate(subscription_data, shipping_data, credit_card_data)
    validators = build_validators(subscription_data, shipping_data, credit_card_data)
    is_valid = validators.map(&:valid?).all?
    errors = validators.map(&:errors).map(&:full_messages).flatten

    [is_valid, errors]
  rescue ActiveModel::UnknownAttributeError => e
    errors = ["Unknown attribute #{e.attribute}"]

    [false, errors]
  end

  def build_validators(subscription_data, shipping_data, credit_card_data)
    [
      SubscriptionDataValidator.new(subscription_data),
      ShippingDataValidator.new(shipping_data),
      CreditCardDataValidator.new(credit_card_data),
    ]
  end

  def build_models(subscription_data, shipping_data, credit_card_data)
    {
      subscription: Subscription.new(subscription_data),
      shipping: Shipping.new(shipping_data),
      credit_card: CreditCard.new(credit_card_data),
    }
  end
end
