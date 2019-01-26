module AuthenticationHelper
  def stub_authentication
    V1::BaseController.any_instance.stubs(:authenticate).returns(true)
  end
end
