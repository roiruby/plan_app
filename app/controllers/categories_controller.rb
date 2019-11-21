class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @plans = @category.plans.order('id DESC').page(params[:page]).per(20)
  end
end
