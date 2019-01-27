require "net/http"

module Fakeway
  class ApiClient
    PURCHASE_URL = "https://www.fakepay.io/purchase"

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
