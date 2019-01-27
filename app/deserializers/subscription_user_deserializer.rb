class SubscriptionUserDeserializer
  include ActiveModelSerializers::Deserialization

  def parse(json)
    user_data = jsonapi_parse(json, only: [:user_id])

    user_data[:user_id]
  end
end
