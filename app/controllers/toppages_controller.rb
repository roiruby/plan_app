class ToppagesController < ApplicationController
  
  def index
    @most_viewed = Plan.published.order('impressions_count DESC').limit(4)
    @plans = Plan.published.order(time: "DESC").limit(4)
    @users = User.order("RAND()").limit(6)
    
    
    @tags = Plan.published.all_tags.order("taggings_count DESC").limit(10)
    
    @recomends = Plan.published.order(time: "DESC").tagged_with("タピオカ, 食べ歩き").limit(4)
    
  end
end
