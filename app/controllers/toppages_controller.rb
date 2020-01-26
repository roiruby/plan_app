class ToppagesController < ApplicationController
  before_action :devise_variant
  
  def index
    @most_viewed = Plan.published.order('impressions_count DESC').limit(4)
    @plans = Plan.published.order(time: "DESC").limit(4)
    @users = User.order("RAND()").limit(6)
    @users_sp = User.order("RAND()").limit(12)
    
    @tags = Plan.published.all_tags.order("taggings_count DESC").limit(12)
    
    @recomends = Plan.published.order(time: "DESC").tagged_with("タピオカ").limit(4)
    
  end
  
  def tos
  end
  
  def privacy
  end
  
  def company
  end
  
  private
  
  def devise_variant
      case request.user_agent
      # when /iPad/
      #   request.variant = :tablet
      when /iPhone/
        request.variant = :mobile
      when /android/
        request.variant = :android
      end
  end
  
end
