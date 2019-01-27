class SubscriptionDeserializer
  include ActiveModelSerializers::Deserialization

  def parse(json)
    subscription_data = jsonapi_parse(json)

    subscription = Subscription.new(subscription_data.except(:shipping, :credit_card))
    shipping = Shipping.new(subscription_data[:shipping])
    credit_card = CreditCard.new(subscription_data[:credit_card])
    models = [subscription, shipping, credit_card]

    return [:error, { errors: collect_errors(models) }] unless models.map(&:valid?).all?

    [:ok, { shipping: shipping, credit_card: credit_card, subscription: subscription }]
  end

  private

  def collect_errors(models)
    models
      .map(&:errors)
      .map(&:full_messages)
      .flatten
  end
end
