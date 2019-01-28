require "test_helper"
require_relative "./authentication_helper"

module V1
  class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
    include AuthenticationHelper

    def setup
      stub_authentication
    end

    test "creates a subscription for a new customer" do
      shipping_attributes = {
        "name" => "Iris Watson",
        "address" => "P.O. Box 283 8562 Fusce Rd.",
        "zip_code" => "20620",
      }
      credit_card_attributes = {
        "card_number" => "4242424242424242",
        "expiration_month" => "01",
        "expiration_year" => "2024",
        "cvv" => "123",
        "zip_code" => "20620",
      }
      subscription_json = {
        "data" => {
          "id" => nil,
          "type" => "subscription",
          "attributes" => {
            "shipping" => shipping_attributes,
            "credit_card" => credit_card_attributes,
            "product_id" => "gold",
            "customer_id" => nil,
          },
        },
      }
      params = { data: subscription_json }
      NewCustomerSubscribes.any_instance.stubs(:call).returns([:ok, nil])

      post v1_subscriptions_path, params: params, as: :json

      assert_response :success
    end

    test "doesn't create a subscription for an existing customer" do
      subscription_json = {
        "data" => {
          "id" => nil,
          "type" => "subscription",
          "attributes" => {
            "product_id" => "1",
            "customer_id" => "123",
          },
        },
      }
      params = { data: subscription_json }

      post v1_subscriptions_path, params: params, as: :json

      assert_response :bad_request
      assert_equal ["Purchases for existing customers are not implemented"].to_json, response.body
    end
  end
end
