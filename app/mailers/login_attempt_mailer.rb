class LoginAttemptMailer < ApplicationMailer
  def success_attempt
    @user = params[:user]
    mail(to: @user.email, subject: 'New login attempt to your account!')
  end
end
