module V1
  module AuthenticationHelper
    def stub_authentication
      BaseController.any_instance.stubs(:authenticate).returns(true)
    end
  end
end
