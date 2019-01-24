require "test_helper"

class V1::BaseControllerTest < ActionDispatch::IntegrationTest
  test "should fail when no token provided" do
    get v1_root_path, as: :json

    assert_response :unauthorized
    assert_equal 'Not authorized', response.body
  end

  test "should succeed when a token provided" do
    token = "ANYTHING"
    headers = {
      'Authorization': "Token token=\"#{token}\"",
    }

    get v1_root_path, headers: headers, as: :json

    assert_response :success
  end
end
