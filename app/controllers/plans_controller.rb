class PlansController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :set_plan_tags_to_gon, only: [:edit]
  before_action :set_available_tags_to_gon, only: [:new, :edit, :create, :update]
  
  def index
    @plans = Plan.published.all.reverse_order.page(params[:page]).per(20)
  end

  def show
    @plan = Plan.find(params[:id])
    @schedules = @plan.schedules
    # @keywords = @plan.keywords
    @count_likes = Favorite.where(plan: @plan.id).count
    @user = @plan.user
    impressionist(@plan, nil, :unique => [:session_hash])
    @relation_plans = Plan.published.includes([:category, :spot]).where(["category_id = ? and spot_id = ?","#{@plan.category_id}", "#{@plan.spot_id}"]).references([:category, :spot]).order("RAND()").limit(4).where.not(id: @plan.id)
    @most_viewed = Plan.published.order('impressions_count DESC').limit(5).where.not(id: @plan.id)
    @plans = Plan.published.order(time: "DESC").limit(5).where.not(id: @plan.id)
    @recomends = Plan.published.tagged_with("タピオカ").limit(5).where.not(id: @plan.id)
    
    if @plan.draft?
      draftplan
    end
  end
  
  def new
    @plan = current_user.plans.build
    @plan.schedules.build
  end

  def create
    @plan = current_user.plans.build(plan_params,)
    if @plan.save
      redirect_to user_path(@plan.user_id)
    else
      flash[:danger] = 'プランの投稿に失敗しました。'
      render :new 
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      redirect_to plan_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @plan.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to user_path(@plan.user_id)
  end
  
  def new_arrival
    @plans = Plan.published.order(time: "DESC").page(params[:page]).per(20)
  end
  def popular
    @plans = Plan.published.order('impressions_count DESC').limit(300).page(params[:page]).per(20)
  end
  def recommend
    @plans = Plan.published.order(time: "DESC").tagged_with("タピオカ, 食べ歩き").page(params[:page]).per(20)
  end
  
  # def keywordAutocomplete
  #   @keywords = Keyword.includes(:plans).all.where('name LIKE ?', "%#{params[:term]}%")
  #   render json: @keywords.map{ |keyword| {name:keyword.name, count: keyword.plans.size}}.to_json
  # end
  
  def confirm
    @user = current_user
    @plans = @user.plans.draft.order("time DESC").page(params[:page]).per(20)
    @count_draft = @user.plans.draft.count
  end
  
  def search
    @plan = Plan.published.order("time DESC")
    @search_word = params[:search]
    
    if params[:search] == ""
      @plans = Plan.published.order("time DESC")
    else
      searches = params[:search].split(/[[:blank:]]+/).select(&:present?)
      @plans = Plan
      searches.each do |search|
      @plans = @plans.published.includes([:schedules, :category, :prefecture, :city, :spot, :tags])
      .where(['plans.plan_title LIKE ? OR plans.content LIKE ? OR schedules.schedule_title LIKE ? OR schedules.content LIKE ? OR categories.category LIKE ? OR prefectures.name LIKE ? OR cities.name LIKE ? OR spots.name LIKE ? OR tags.name LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]).references([:schedules, :category, :prefecture, :city, :spot, :tags])
      end
    end
    @plans = @plans.published.order("time DESC").page(params[:page]).per(20)
  end
  
  def select_search
    @plans = Plan.published.order("time DESC")
    @plan = Plan.published.order("time DESC")
    @name = params[:plan]
    
    if params[:plan].present?
    @plans = @plans.get_by_plan params[:plan]
    end
    # if params[:prefecture].present?
    # @plans = @plans.get_by_prefecture params[:prefecture]
    # end
    if params[:category].present?
    @plans = @plans.get_by_category params[:category]
    @category_name = Category.find(params[:category]).category
    end
    if params[:budget].present?
    @plans = @plans.get_by_budget params[:budget]
    @budget_name = Budget.find(params[:budget]).name
    end
    @plans = @plans.page(params[:page]).per(20)
  end
  
  def draftplan
    redirect_to root_path unless current_user == @user
  end
  
  

  
  private

  def plan_params
    params.require(:plan).permit(
    :plan_title, :content, :image, :remove_image, :user_id, :category_id, :budget_id, :prefecture_id, :city_id, :spot_id, :tag_list, :status,
    {schedules_attributes: [
        :schedule_title, :start_time, :end_time, :image1, :image2, :image3, :image4, :remove_image1, :remove_image2, :remove_image3, :remove_image4, :sub_title, :content, :spot_name, :address, :access, :business_hour, :regular_holiday, :tel, :parking, :budget, :link_url, :comment, :_destroy, :id]},
    {keywords_attributes: [
        :name, :_destroy, :id]})
  end
  
  def correct_user
    @plan = current_user.plans.find_by(id: params[:id])
    unless @plan
      redirect_to root_url
    end
  end
  
  def set_plan_tags_to_gon
    gon.plan_tags = @plan.tag_list
  end
  def set_available_tags_to_gon
    gon.available_tags = Plan.tags_on(:tags).pluck(:name)
  end


end