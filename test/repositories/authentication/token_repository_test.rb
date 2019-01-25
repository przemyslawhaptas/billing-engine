module Authentication
  class TokenRepositoryTest < ActiveSupport::TestCase
    test "#exists? should return true if parameters match an existing token" do
      token_value = Token.generate_unique_secure_token
      Token.create!(value: token_value)
      token_repository = TokenRepository.new

      exists = token_repository.exists?(value: token_value)

      assert exists
    end

    test "#exists? should return false if parameters don't match an existing token" do
      token_value = Token.generate_unique_secure_token
      Token.create!(value: token_value)
      passed_token_value = "A FAKE"
      token_repository = TokenRepository.new

      exists = token_repository.exists?(value: passed_token_value)

      refute exists
    end
  end
end
