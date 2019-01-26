require "test_helper"
require_relative "./authentication_helper"

module V1
  class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
    include AuthenticationHelper

    def setup
      stub_authentication
    end

    test "creates a new subscription" do
      shipping_attributes = {
        "name" => "Iris Watson",
        "address" => "P.O. Box 283 8562 Fusce Rd.",
        "zip_code" => "20620",
      }
      billing_attributes = {
        "card_number" => "4242424242424242",
        "expiration_day" => "01",
        "expiration_month" => "2024",
        "cvv" => "123",
        "zip_code" => "20620",
      }
      subscription_json = {
        "data" => {
          "id" => nil,
          "type" => "subscription",
          "attributes" => {
            "shipping" => shipping_attributes,
            "billing" => billing_attributes,
            "product_id" => "1",
            "user_id" => nil,
          },
        },
      }
      params = { data: subscription_json }

      post v1_subscriptions_path, params: params, as: :json

      assert_response :success
    end
  end
end
