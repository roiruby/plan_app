class ToppagesController < ApplicationController
  def index
    @plans = Plan.limit(4).order('id DESC')
    @users = User.order(id: :desc).page(params[:page]).per(6)
    @most_viewed = Plan.order('impressions_count DESC').limit(4)
    @keyword = Keyword.find(1)
    @recomends = @keyword.plans

    
    
    @parents = Area.all.order("id ASC").limit(12)
    
  end
end
