class SubscriptionDeserializerTest < ActiveSupport::TestCase
  test "plucks user_id from subscription json" do
    deserializer = SubscriptionUserDeserializer.new
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
          "user_id" => 1,
        },
      },
    }

    user_id = deserializer.parse(subscription_json)

    assert_equal 1, user_id
  end
end
