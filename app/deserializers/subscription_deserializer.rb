class SubscriptionDeserializer
  include ActiveModelSerializers::Deserialization

  def parse(json)
    subscription_data = jsonapi_parse(json)

    subscription = Subscription.new(subscription_data.except(:shipping, :billing))
    shipping = Shipping.new(subscription_data[:shipping])
    billing = Billing.new(subscription_data[:billing])
    models = [subscription, shipping, billing]

    return [:error, collect_errors(models)] unless models.map(&:valid?).all?

    [:ok, { shipping: shipping, billing: billing, subscription: subscription }]
  end

  private

  def collect_errors(models)
    models
      .map(&:errors)
      .map(&:full_messages)
      .flatten
  end
end
