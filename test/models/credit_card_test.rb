require "test_helper"

class CreditCardTest < ActiveSupport::TestCase
  test "serves as attributes bag" do
    credit_card_data = CreditCard.new(
      card_number: "4242424242424242",
      cvv: "123",
      expiration_month: "01",
      expiration_year: "2024",
      zip_code: "20620"
    )

    assert_equal "20620", credit_card_data.zip_code
  end
end
