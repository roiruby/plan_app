class SpotsController < ApplicationController
  def index
    city = City.find(params[:city_id])
    render json: city.spots.select(:id, :name)
  end
end
