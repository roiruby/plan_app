class MypageController < ApplicationController
  before_action :require_user_logged_in, only: [:index]
  before_action :correct_user, only: [:index]
  
  def index
    @user = current_user
    @plans = @user.plans.page(params[:page]).per(20).reverse_order
    counts(@user)
  end
  
  private
  
  def correct_user
      @user = current_user
      redirect_to(root_url) unless @user == current_user
  end
  
end
