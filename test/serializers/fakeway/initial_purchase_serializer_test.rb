require "test_helper"

module Fakeway
  class InitialPurchaseSerializerTest < ActiveSupport::TestCase
    test "serializes an amount and credit card info" do
      amount = 1234
      credit_card = CreditCard.new(
        card_number: "4242424242424242",
        expiration_month: "01",
        expiration_year: "2024",
        cvv: "123",
        zip_code: "20620"
      )

      json = InitialPurchaseSerializer.new.call(amount, credit_card)

      expected_json = {
        "amount" => "1234",
        "card_number" => "4242424242424242",
        "cvv" => "123",
        "expiration_month" => "01",
        "expiration_year" => "2024",
        "zip_code" => "20620",
      }.to_json
      assert_equal expected_json, json
    end
  end
end
