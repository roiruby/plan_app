class CitiesController < ApplicationController
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
    @plans = @city.plans.order('id DESC').page(params[:page]).per(20)
  end
  
end
