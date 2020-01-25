class CitiesController < ApplicationController
  before_action :devise_variant
  
  def index
    prefecture = Prefecture.find(params[:prefecture_id])
    cities = prefecture.cities.map do |city|
      {
          id: city.id,
          name: city.name,
          path: prefecture_city_spots_path(city.id, city)
      }    
    end
    render json: cities
  end
  
  def show
    @city = City.find(params[:id])
    @plans = @city.plans.published.order('time DESC').page(params[:page]).per(20)
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
