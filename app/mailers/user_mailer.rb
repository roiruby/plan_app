class UserMailer < ApplicationMailer
  
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "【Pladuce】メールアドレス確認"
  end
  
  def send_account_activation(user)
    @user = user
    mail to: user.email, subject: "【Pladuce】登録完了のお知らせ"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "【Pladuce】パスワード再設定のお申込み"
  end
  
  def edit_profile(user)
    @user = user
    mail to: user.email, subject: "【Pladuce】アカウント情報変更完了のお知らせ"
  end

end
