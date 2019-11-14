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
end
