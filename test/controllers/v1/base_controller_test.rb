require "test_helper"

class V1::BaseControllerTest < ActionDispatch::IntegrationTest
  test "should fail when no token provided" do
    get v1_root_path, as: :json

    assert_response :unauthorized
    assert_equal 'Not authorized', response.body
  end

  test "should succeed when a correct token provided" do
    token = Authentication::Token.generate_unique_secure_token
    Authentication::Token.create!(value: token)
    headers = {
      'Authorization': "Token token=\"#{token}\"",
    }

    get v1_root_path, headers: headers, as: :json

    assert_response :success
  end
end
