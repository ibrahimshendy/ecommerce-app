class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json
  before_action :configure_sign_in_params, only: [:create]

  protected
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:user, keys: [:email, :password])
  end

  private
  def respond_with(resource, _opts = {})
    @token = request.env['warden-jwt_auth.token']
    headers['Authorization'] = @token

    LoginAttemptMailer.with(user: resource).success_attempt.deliver_later

    render json: { token: @token }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        status: 200,
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end
