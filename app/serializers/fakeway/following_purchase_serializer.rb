module Fakeway
  class FollowingPurchaseSerializer
    def call(amount, billing)
      {
        "amount" => amount.to_s,
        "token" => billing.purchase_token,
      }.to_json
    end
  end
end
