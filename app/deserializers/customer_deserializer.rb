class CustomerDeserializer
  include ActiveModelSerializers::Deserialization

  def parse(json)
    customer_data = jsonapi_parse(json, only: [:customer_id])

    customer_data[:customer_id]
  end
end
