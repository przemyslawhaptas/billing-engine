require "test_helper"

module Fakeway
  class InitialPurchaseTest < ActiveSupport::TestCase
    test "orchestrates the intiial purchase call to the Fakeway API" do
      api_client = mock
      request_serializer = mock
      response_deserializer = mock
      subject = InitialPurchase.new(
        api_client: api_client,
        request_serializer: request_serializer,
        response_deserializer: response_deserializer
      )
      amount = 100
      credit_card = {}
      request_body = ""
      response_body = ""

      request_serializer.expects(:call).with(amount, credit_card).returns(request_body)
      api_client.expects(:purchase).with(request_body).returns(response_body)
      response_deserializer.expects(:parse).with(response_body)

      subject.call(amount, credit_card)
    end
  end
end
