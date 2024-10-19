# frozen_string_literal: true
module ControllerMacros
  def login_user
    # Before each test, create and login the user
      before(:each) do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        sign_in Fabricate(:user, email: 'test@test.com', password: 'password', type: 'User')
      end
  end
end