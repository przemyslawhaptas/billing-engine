class CreateSubscriptionForExistingUser
  def call(_subscription_json)
    [:invalid_data, ["Purchases for existing users are not implemented"]]
  end
end
