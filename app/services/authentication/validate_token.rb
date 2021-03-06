module Authentication
  class ValidateToken
    def initialize(token_repository: TokenRepository.new)
      @token_repository = token_repository
    end

    def call(token)
      token_repository.exists?(value: token)
    end

    private

    attr_reader :token_repository
  end
end
