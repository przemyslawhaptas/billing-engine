require "net/http"

module Fakeway
  class ApiClient
    PURCHASE_URL = "https://www.fakepay.io/purchase"
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

    def initialize(access_key: Rails.application.credentials.fakeway[:access_key])
      @access_key = access_key
    end

    def purchase(body)
      response = post(PURCHASE_URL, body)

      response.body
    end

    def post(url, body)
      uri = URI(url)

      Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(prepare_request(uri, body))
      end
    end

    def prepare_request(uri, body)
      Net::HTTP::Post.new(uri).tap do |req|
        req.body = body
        req["Authorization"] = "Token token=#{access_key}"
        req["Content-Type"] = "application/json"
      end
    end

    private

    attr_reader :access_key
  end
end
