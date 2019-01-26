module V1
  class SubscriptionDeserializer
    include ActiveModelSerializers::Deserialization

    def parse!(json)
      subscription_data = jsonapi_parse!(json)

      {
        shipping: Shipping.new(subscription_data.fetch(:shipping)),
        billing: Billing.new(subscription_data.fetch(:billing)),
        subscription: Subscription.new(subscription_data.except(:shipping, :billing)),
      }
    end
  end
end
