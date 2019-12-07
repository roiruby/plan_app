class SpotsController < ApplicationController
  def index
    city = City.find(params[:city_id])
    render json: city.spots.select(:id, :name)
  end
  
  def show
    @spot = Spot.find(params[:id])
    @plans = @spot.plans.published.order('id DESC').page(params[:page]).per(20)
  end
  
end
