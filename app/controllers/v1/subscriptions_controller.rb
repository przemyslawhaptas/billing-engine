module V1
  class SubscriptionsController < BaseController
    def create
      status_codes = {
        ok: 200,
        invalid_data: 400,
        purchase_failed: 400,
      }

      is_a_new_user = SubscriptionUserDeserializer.new.parse(subscription_json).nil?
      use_case = is_a_new_user ? CreateSubscriptionForNewUser.new : CreateSubscriptionForExistingUser.new
      result, response = use_case.call(subscription_json)

      render json: response, status: status_codes[result]
    end

    private

    def subscription_json
      params.require(:data)
    end
  end
end
