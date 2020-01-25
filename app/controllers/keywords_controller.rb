class KeywordsController < ApplicationController
  before_action :devise_variant
  
  def index
    @plans = params[:tag].present? ? Plan.published.tagged_with(params[:tag]) : Plan.published.all
    @plans = @plans.includes(:tags).reverse_order.page(params[:page]).per(20)
    @keywords = params[:tag]
  end
  
  def show
  end
  
  
  private
  
  def devise_variant
      case request.user_agent
      when /iPhone/
        request.variant = :mobile
      when /android/
        request.variant = :android
      end
  end
  
end
