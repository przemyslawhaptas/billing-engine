module Fakeway
  class InitialPurchaseDeserializer
    ERROR_MESSAGES = {
      1_000_001 => "Invalid credit card number",
      1_000_002 => "Insufficient funds",
      1_000_003 => "CVV failure",
      1_000_004 => "Expired card",
      1_000_005 => "Invalid zip code",
      1_000_006 => "Invalid purchase amount",
      1_000_007 => "Invalid token",
      1_000_008 => "Invalid params: cannot specify both token and other credit " \
                   "card params like card_number, cvv, expiration_month, expiration_year " \
                   "or zip.",
    }

    def parse(response_json)
      response_data = JSON.parse(response_json)

      if response_data["token"].nil?
        error_code = response_data["error_code"]

        return [:error, { errors: [ERROR_MESSAGES[error_code]] }]
      end

      [:ok, { token: response_data["token"] }]
    end
  end
end
