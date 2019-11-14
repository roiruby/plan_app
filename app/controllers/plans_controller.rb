class PlansController < ApplicationController
  before_action :require_user_logged_in, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def index
  end

  def show
    @plan = Plan.find(params[:id])
    @schedules = @plan.schedules
    @keywords = @plan.keywords
    @count_likes = Favorite.where(plan: @plan.id).count
    
    

    
    # @plans = Plan.includes(keywords: :plans).all
  end
  
  def new
    @plan = current_user.plans.build
    @plan.schedules.build
    @plan.keywords.build
    
    @area_parent_array = ["---"]
    Area.where(ancestry: nil).each do |parent|
      @area_parent_array << parent.name
    end
    
  end

  def create
    @plan = current_user.plans.build(plan_params,)
    if @plan.save
      flash[:success] = 'プランを投稿しました。'
      redirect_to user_path(@plan.user_id)
    else
      flash[:danger] = 'プランの投稿に失敗しました。'
      render :new 
    end
  end

  def edit
    @plan = Plan.find(params[:id])
    
    # @parents = Area.where(ancestry:nil)
    # # 登録されているエリアの孫カテゴリーのレコードを取得
    # @selected_grandchild_area = @plan.area
    # # 孫カテゴリー選択肢用の配列作成
    # @area_grandchildren_array = [{id: "---", name: "---"}]
    # Area.find("#{@selected_grandchild_area.id}").siblings.each do |grandchild|
    #   grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
    #   @area_grandchildren_array << grandchildren_hash
    # end
    # # 選択されている子カテゴリーのレコードを取得
    # @selected_child_area = @selected_grandchild_area.parent
    # # 子カテゴリー選択肢用の配列作成
    # @area_children_array = [{id: "---", name: "---"}]
    # Area.find("#{@selected_child_area.id}").siblings.each do |child|
    #   children_hash = {id: "#{child.id}", name: "#{child.name}"}
    #   @area_children_array << children_hash
    # end
    # # 選択されている親カテゴリーのレコードを取得
    # @selected_parent_area = @selected_child_area.parent
    # # 親カテゴリー選択肢用の配列作成
    # @area_parents_array = [{id: "---", name: "---"}]
    # Area.find("#{@selected_parent_area.id}").siblings.each do |parent|
    #   parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
    #   @area_parents_array << parent_hash
    # end
    
  end

  def update
    @plan = Plan.find(params[:id])

    if @plan.update(plan_params)
      flash[:success] = '正常に更新されました'
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
    @plans = Plan.order('id DESC').page(params[:page]).per(20)
  end
  
  def keywordAutocomplete
    @keywords = Keyword.includes(:plans).all.where('name LIKE ?', "%#{params[:term]}%")
    render json: @keywords.map{ |keyword| {name:keyword.name, count: keyword.plans.size}}.to_json
  end
  
  def search
    @plans = Plan.search(params[:search]).reverse_order.page(params[:page]).per(20)
  end
  
  #エリア動的フォーム
  # 親カテゴリーが選択された後に動くアクション
  def get_area_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @area_children = Area.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  def get_area_grandchildren
    @area_grandchildren = Area.find("#{params[:child_id]}").children
  end
  
  private

  def plan_params
    params.require(:plan).permit(
    :plan_title, :content, :image, :remove_image, :user_id, :category_id, :area_id,
    {schedules_attributes: [
        :schedule_title, :start_time, :end_time, :image1, :image2, :image3, :image4, :remove_image1, :remove_image2, :remove_image3, :remove_image4, :sub_title, :content, :spot_name, :address, :access, :business_hour, :regular_holiday, :tel, :parking, :budget, :link_url, :comment, :_destroy, :id]},
    {keywords_attributes: [
        :name]})
  end
  
  def correct_user
    @plan = current_user.plans.find_by(id: params[:id])
    unless @plan
      redirect_to root_url
    end
  end


end