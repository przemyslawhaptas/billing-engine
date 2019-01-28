require "test_helper"

module Fakeway
  class FollowingPurchaseSerializerTest < ActiveSupport::TestCase
    test "serializes an amount and biling info" do
      amount = 1234
      billing = Billing.new(purchase_token: "gu23bfiubfiu23bf")

      json = FollowingPurchaseSerializer.new.call(amount, billing)

      expected_json = {
        "amount" => "1234",
        "token" => "gu23bfiubfiu23bf",
      }.to_json
      assert_equal expected_json, json
    end
  end
end
