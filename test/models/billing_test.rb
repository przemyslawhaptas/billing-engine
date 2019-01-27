require "test_helper"

class CreditCardTest < ActiveSupport::TestCase
  test "is valid" do
    credit_card_data = CreditCard.new(
      card_number: "4242424242424242",
      cvv: "123",
      expiration_month: "01",
      expiration_year: "2024",
      zip_code: "20620"
    )

    assert credit_card_data.valid?
  end
end
