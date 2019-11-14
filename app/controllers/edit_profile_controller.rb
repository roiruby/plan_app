class EditProfileController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to mypage_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,)
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end


end
