class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_to mypage_path
      else
        message   = "アカウントは有効ではありません。"
        message  += "メールで送られた認証URLをクリックし登録を完了させてください！"
        flash[:warning] = message
        render 'new'
      end
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end
  
  def register
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

end