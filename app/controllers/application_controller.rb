class ApplicationController < ActionController::Base
    
  include SessionsHelper
    
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_plans = user.plans.published.count
    @count_favplans = user.favplans.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
  
end
