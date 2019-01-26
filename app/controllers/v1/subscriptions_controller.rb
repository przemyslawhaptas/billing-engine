module V1
  class SubscriptionsController < BaseController
    def create
      SubscriptionDeserializer.new.parse!(subscription_json)

      render status: 500
    end

    private

    def subscription_json
      params.require(:data)
    end
  end
end
