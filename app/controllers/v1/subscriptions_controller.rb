module V1
  class SubscriptionsController < BaseController
    def create
      status_codes = {
        ok: 200,
        invalid_data: 400,
      }

      result, response = CreateSubscription.new.call(subscription_json)

      render json: response, status: status_codes[result]
    end

    private

    def subscription_json
      params.require(:data)
    end
  end
end
