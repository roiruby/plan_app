class KeywordsController < ApplicationController
  def index
    @plans = params[:tag].present? ? Plan.published.tagged_with(params[:tag]) : Plan.published.all
    @plans = @plans.includes(:tags).reverse_order.page(params[:page]).per(20)
    @keywords = params[:tag]
  end
  
  def show
  end
  
end
