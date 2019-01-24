require "active_support/core_ext/securerandom"

module Authentication
  class GenerateToken
    def initialize(token_repository: TokenRepository.new)
      @token_repository = token_repository
    end

    def call
      token = Token.new(value: Token.generate_unique_secure_token)

      token_repository.save!(token)
    end

    private

    attr_reader :token_repository
  end
end
