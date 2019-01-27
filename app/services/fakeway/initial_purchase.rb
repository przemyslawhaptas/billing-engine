module Fakeway
  class InitialPurchase
    def initialize(
      request_serializer: InitialPurchaseSerializer.new,
      response_deserializer: InitialPurchaseDeserializer.new,
      api_client: ApiClient.new
    )
      @request_serializer = request_serializer
      @response_deserializer = response_deserializer
      @api_client = api_client
    end

    def call(amount, credit_card)
      request_body = request_serializer.call(amount, credit_card)
      response_body = api_client.purchase(request_body)

      response_deserializer.parse(response_body)
    end

    private

    attr_reader :request_serializer, :response_deserializer, :api_client
  end
end
