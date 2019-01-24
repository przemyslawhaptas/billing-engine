require "test_helper"

class Authentication::ValidateTokenTest < ActiveSupport::TestCase
  test "#call returns true" do
    subject = Authentication::ValidateToken.new
    token = "ANYTHING"
    options = {}

    result = subject.call(token, options)

    assert_equal true, result
  end
end
