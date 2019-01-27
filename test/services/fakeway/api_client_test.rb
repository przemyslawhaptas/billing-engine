require "test_helper"
require "uri"

module Fakeway
  class ApiClientTest < ActiveSupport::TestCase
    test "prepares a correct request" do
      uri = URI("https://www.fakepay.io/purchase")
      body = {
        "amount" => "10000",
        "card_number" => "4242424242424242",
        "cvv" => "123",
        "expiration_month" => "01",
        "expiration_year" => "2024",
        "zip_code" => "20620",
      }.to_json
      token = "1234"
      subject = ApiClient.new(access_key: token)

      request = subject.prepare_request(uri, body)

      assert_equal body, request.body
      assert_equal "Token token=#{token}", request["Authorization"]
      assert_equal uri, request.uri
    end
  end
end
