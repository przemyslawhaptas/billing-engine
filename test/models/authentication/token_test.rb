require "test_helper"

module Authentication
  class TokenTest < ActiveSupport::TestCase
    test "is valid" do
      subject = Token.new(value: Token.generate_unique_secure_token)

      is_valid = subject.valid?

      assert is_valid
    end
  end
end
