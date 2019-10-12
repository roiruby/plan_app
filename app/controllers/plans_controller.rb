class PlansController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
  end

  def show
    @plan = Plan.find(params[:id])
  end
  
  def new
    @plan = current_user.plans.build
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      flash[:success] = 'プランを投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'プランの投稿に失敗しました。'
      redirect_to new_plan_path    
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      flash[:success] = '正常に更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @plan.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to root_path
  end
  
  private

  def plan_params
    params.require(:plan).permit(:plan_title, :content, :image, :remove_image, :user_id)
  end
  
  def correct_user
    @plan = current_user.plans.find_by(id: params[:id])
    unless @plan
      redirect_to root_url
    end
  end
  
end
