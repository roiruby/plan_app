class ToppagesController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(10)
    @parents = Area.all.order("id ASC").limit(12)
  end
end
