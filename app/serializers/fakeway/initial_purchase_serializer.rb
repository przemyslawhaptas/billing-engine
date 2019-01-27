module Fakeway
  class InitialPurchaseSerializer
    def call(amount, billing_info)
      {
        "amount" => amount.to_s,
        "card_number" => billing_info.card_number,
        "cvv" => billing_info.cvv,
        "expiration_month" => billing_info.expiration_month,
        "expiration_year" => billing_info.expiration_year,
        "zip_code" => billing_info.zip_code,
      }.to_json
    end
  end
end
