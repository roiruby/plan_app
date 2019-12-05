class KeywordsController < ApplicationController
  def index
    @plans = params[:tag].present? ? Plan.tagged_with(params[:tag]) : Plan.all
    @plans = @plans.includes(:tags).reverse_order.page(params[:page]).per(20)
    @keywords = params[:tag]
  end
  
  def show
  end
  
end
