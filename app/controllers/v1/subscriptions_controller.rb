module V1
  class SubscriptionsController < BaseController
    def create
      status_codes = {
        ok: 200,
        invalid_data: 400,
        purchase_failed: 400,
      }

      is_new_customer = CustomerDeserializer.new.parse(subscription_json).nil?
      use_case = is_new_customer ? NewCustomerSubscribes.new : ExistingCustomerSubscribes.new
      result, response = use_case.call(subscription_json)

      render json: response, status: status_codes[result]
    end

    private

    def subscription_json
      params.require(:data)
    end
  end
end
