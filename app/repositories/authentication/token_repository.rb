module Authentication
  class TokenRepository
    def save!(token)
      token.save!
    end

    def exists?(attributes)
      Token.where(attributes).exists?
    end
  end
end
