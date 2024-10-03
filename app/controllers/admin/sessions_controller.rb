class Admin::SessionsController < Devise::SessionsController
  respond_to :html
  before_action :configure_sign_in_params, only: [:create]

  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:admin, keys: [:email, :password])
  end
end
