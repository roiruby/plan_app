class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    plan = Plan.find(params[:plan_id])
    current_user.like(plan)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    current_user.unlike(plan)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: root_path)
  end
  
end
