module Fakeway
  class InitialPurchaseSerializer
    def call(amount, credit_card)
      {
        "amount" => amount.to_s,
        "card_number" => credit_card.card_number,
        "cvv" => credit_card.cvv,
        "expiration_month" => credit_card.expiration_month,
        "expiration_year" => credit_card.expiration_year,
        "zip_code" => credit_card.zip_code,
      }.to_json
    end
  end
end
