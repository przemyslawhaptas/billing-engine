class SubscriptionDeserializerTest < ActiveSupport::TestCase
  test "parses a json into Shipping, CreditCard and Subscription models" do
    deserializer = SubscriptionDeserializer.new
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
          "user_id" => nil,
        },
      },
    }

    result, data = deserializer.parse(subscription_json)

    assert_equal :ok, result
    assert_equal "Iris Watson", data.fetch(:shipping).name
    assert_equal "20620", data.fetch(:credit_card).zip_code
    assert_equal "gold", data.fetch(:subscription).product_id
    assert_nil data.fetch(:subscription).user_id
  end

  test "returns errors when the json contains invalid data" do
    deserializer = SubscriptionDeserializer.new
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
    }
    subscription_json = {
      "data" => {
        "id" => nil,
        "type" => "subscription",
        "attributes" => {
          "shipping" => shipping_attributes,
          "credit_card" => credit_card_attributes,
          "user_id" => nil,
        },
      },
    }

    result, data = deserializer.parse(subscription_json)

    assert_equal :error, result
    assert_equal({ errors: ["Product can't be blank", "Zip code can't be blank"] }, data)
  end
end
