class ToppagesController < ApplicationController
  before_action :devise_variant
  
  before_action do
    case params[:device]
      when 'tablet'
        request.variant = :tablet
    end
  end
  
  def index
    @most_viewed = Plan.published.order('impressions_count DESC').limit(4)
    @plans = Plan.published.order(time: "DESC").limit(4)
    @users = User.order("RAND()").limit(6)
    @users_sp = User.order("RAND()").limit(12)
    
    @tags = Plan.published.all_tags.order("taggings_count DESC").limit(12)
    
    @recomends = Plan.published.order(time: "DESC").tagged_with("タピオカ, 食べ歩き").limit(4)
    
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
      #   request.variant = :ipad
      when /iPhone/
        request.variant = :mobile
      when /android/
        request.variant = :android
      end
  end
  
end
