class UserMailer < ApplicationMailer

  def reset_password_email(user)
    @user = User.find(user.id)
    @token = @user.reset_password_token
    @url = edit_password_reset_url(@token)

    mail(
      to: @user.email,
      subject: 'reset password'
    )

  end
end
