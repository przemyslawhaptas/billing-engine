module V1
  class BaseController < ApplicationController
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    REALM = "Application"

    def index
      head :ok
    end

    private

    def authenticate
      failure_message = "Not authorized"

      authenticate_or_request_with_http_token(REALM, failure_message) do |token, _options|
        Authentication::ValidateToken.new.call(token)
      end
    end
  end
end
