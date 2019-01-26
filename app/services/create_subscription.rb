class CreateSubscription
  def initialize(deserializer: SubscriptionDeserializer.new)
    @deserializer = deserializer
  end

  def call(subscription_json)
    result, data = deserializer.parse(subscription_json)
    return [:invalid_data, data] if result == :error

    [:ok, nil]
  end

  private

  attr_reader :deserializer
end
