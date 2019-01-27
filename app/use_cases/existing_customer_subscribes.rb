class ExistingCustomerSubscribes
  def call(_subscription_json)
    [:invalid_data, ["Purchases for existing customers are not implemented"]]
  end
end
