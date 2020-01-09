# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end
  
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/send_account_activation
  def send_account_activation
    user = User.first
    UserMailer.send_account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
  
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/edit_profile
  def edit_profile
    user = User.first
    UserMailer.edit_profile(user)
  end

end