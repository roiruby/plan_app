class PrefecturesController < ApplicationController
  before_action :devise_variant
  
  def show
    @prefecture = Prefecture.find(params[:id])
    @plans = @prefecture.plans.published.order('id DESC').page(params[:page]).per(20)
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
