class PrefecturesController < ApplicationController
  def show
    @prefecture = Prefecture.find(params[:id])
    @plans = @prefecture.plans.published.order('id DESC').page(params[:page]).per(20)
  end
end
