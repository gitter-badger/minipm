class UserMailer < ApplicationMailer
  # Send password reset instruction
  def password_reset(user)
    @user = user
    @user.reset_perishable_token!

    mail to: @user.email, subject: 'Password Resest'
  end
end
