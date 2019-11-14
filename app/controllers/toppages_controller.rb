class ToppagesController < ApplicationController
  def index
    @plans = Plan.limit(4).order('id DESC')
    @users = User.order(id: :desc).page(params[:page]).per(6)
    
    @parents = Area.all.order("id ASC").limit(12)
    
  end
end
