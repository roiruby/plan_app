class FavoriteMailer < ApplicationMailer
  def favorite_notification(user, plan)
    @user = user
    @plan = plan
    mail to: plan.user.email, subject: "【Pladuce】お気に入りに追加されました！"
  end
end
