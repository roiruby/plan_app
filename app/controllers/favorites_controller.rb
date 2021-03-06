class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    plan = Plan.find(params[:plan_id])
    current_user.like(plan)
    FavoriteMailer.favorite_notification(current_user, plan).deliver_now
    redirect_back(fallback_location: root_path)
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    current_user.unlike(plan)
    redirect_back(fallback_location: root_path)
  end
  
end
