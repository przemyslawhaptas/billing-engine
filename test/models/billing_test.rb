require "test_helper"

class BillingTest < ActiveSupport::TestCase
  test "is valid" do
    billing_data = Billing.new(
      card_number: "4242424242424242",
      expiration_day: "01",
      expiration_month: "2024",
      cvv: "123",
      zip_code: "20620"
    )

    assert billing_data.valid?
  end
end
