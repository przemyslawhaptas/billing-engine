require "test_helper"

module Authentication
  class GenerateTokenTest < ActiveSupport::TestCase
    test "creates a new token" do
      subject = GenerateToken.new

      when_called = -> { subject.call }

      assert_difference -> { Token.count }, 1, &when_called
    end
  end
end
