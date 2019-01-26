class SubscriptionDeserializerTest < ActiveSupport::TestCase
  test "parses a json into Shipping, Billing and Subscription models" do
    deserializer = SubscriptionDeserializer.new
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

    result, data = deserializer.parse(subscription_json)

    assert_equal :ok, result
    assert_equal Shipping.name, data.fetch(:shipping).class.name
    assert_equal Billing.name, data.fetch(:billing).class.name
    assert_equal Subscription.name, data.fetch(:subscription).class.name
  end

  test "returns errors when the json contains invalid data" do
    deserializer = SubscriptionDeserializer.new
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
    }
    subscription_json = {
      "data" => {
        "id" => nil,
        "type" => "subscription",
        "attributes" => {
          "shipping" => shipping_attributes,
          "billing" => billing_attributes,
          "user_id" => nil,
        },
      },
    }

    result, data = deserializer.parse(subscription_json)

    assert_equal :error, result
    assert_equal ["Product can't be blank", "Zip code can't be blank"], data
  end
end
