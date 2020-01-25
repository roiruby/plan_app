class SpotsController < ApplicationController
  before_action :devise_variant
  
  def index
    city = City.find(params[:city_id])
    render json: city.spots.select(:id, :name)
  end
  
  def show
    @spot = Spot.find(params[:id])
    @plans = @spot.plans.published.order('id DESC').page(params[:page]).per(20)
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
