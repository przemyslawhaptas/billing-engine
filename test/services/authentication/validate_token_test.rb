require "test_helper"

module Authentication
  class ValidateTokenTest < ActiveSupport::TestCase
    test "should return true if token is correct" do
      token = Token.generate_unique_secure_token
      Token.create!(value: token)
      passed_token = token
      subject = ValidateToken.new

      token_is_correct = subject.call(passed_token)

      assert token_is_correct
    end

    test "should return false if token is not correct" do
      token = Token.generate_unique_secure_token
      Token.create!(value: token)
      passed_token = Token.generate_unique_secure_token
      subject = ValidateToken.new

      token_is_correct = subject.call(passed_token)

      refute token_is_correct
    end
  end
end
