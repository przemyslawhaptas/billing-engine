class V1::BaseController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  REALM = 'Application'

  def index
    head :ok
  end

  private

  def authenticate
    failure_message = 'Not authorized'
    validate_token = Authentication::ValidateToken.new

    authenticate_or_request_with_http_token(REALM, failure_message) do |token, options|
      Authentication::ValidateToken.new.call(token, options)
    end
  end
end
