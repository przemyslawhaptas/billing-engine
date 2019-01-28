require "test_helper"

module Fakeway
  class InitialPurchaseDeserializerTest < ActiveSupport::TestCase
    test "parses successful Fakeway API POST /purchase response body" do
      deserializer = InitialPurchaseDeserializer.new
      response_body = "{\"token\":\"dde1d8a37e29b9a35cb1deecef4cf7\",\"success\":true,\"error_code\":null}"

      result, data = deserializer.parse(response_body)
      billing = data[:billing]

      assert_equal :ok, result
      assert_equal "dde1d8a37e29b9a35cb1deecef4cf7", billing.purchase_token
    end

    test "parses unsuccessful Fakeway API POST /purchase response body" do
      deserializer = InitialPurchaseDeserializer.new
      response_body = "{\"token\":null,\"success\":true,\"error_code\":1000001}"

      result, data = deserializer.parse(response_body)

      assert_equal [:error, { errors: ["Invalid credit card number"] }], [result, data]
    end
  end
end
