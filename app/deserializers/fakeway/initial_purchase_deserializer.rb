module Fakeway
  class InitialPurchaseDeserializer
    def parse(response_json)
      response_data = JSON.parse(response_json)

      if response_data["token"].nil?
        error_code = response_data["error_code"]

        return [:error, { errors: [ApiClient::ERROR_MESSAGES[error_code]] }]
      end

      [:ok, build_models(response_data["token"])]
    end

    private

    def build_models(purchase_token)
      {
        billing: Billing.new(purchase_token: purchase_token),
      }
    end
  end
end
