class SchedulesController < ApplicationController
  before_action :require_user_logged_in, only: [:create]
  

  def create
    @schedule = current_user.schedules.build(schedule_params)
    if @schedule.save
      flash[:success] = 'プランを投稿しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'プランの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:schedule_title, :content, :start_time, :end_time, :image1, :image2, :image3, :image4, :sub_title, :spot_name, :address, :access, :business_hour, :regular_holiday, :tel, :parking, :budget,:link_url, :comment, :remove_image1)
  end
  
end
