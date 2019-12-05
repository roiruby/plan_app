class ToppagesController < ApplicationController
  
  def index
    @plans = Plan.limit(4).order('id DESC')
    @users = User.order(id: :desc).page(params[:page]).per(6)
    @most_viewed = Plan.order('impressions_count DESC').limit(4)
    
    @tags = Plan.all_tags.order("taggings_count DESC").limit(10)
    
    @recomends = Plan.tagged_with("タピオカ").limit(4)
    
  end
end
