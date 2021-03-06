class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update, :followings, :followers, :edit_profile, :update_profile, :index]
  before_action :correct_user,   only: [:edit, :update, :edit_profile, :update_profile]
  before_action :admin_user, only: [:destroy, :index]
  before_action :devise_variant
  
  def index
    @users = User.all.page(params[:page]).per(30).reverse_order
  end

  def show
    @user = User.find(params[:id])
    # @plans = Plan.find_by(id: params[:id])
    @plans = @user.plans.published.order("time DESC").page(params[:page]).per(20)
    counts(@user)
    
    if params[:search] == ""
      @plans = @user.plans.published.order("time DESC").page(params[:page]).per(20)
    else
      searches = params[:search].to_s.split(/[[:blank:]]+/).select(&:present?)
      @plans = @user.plans
      searches.each do |search|
      @plans = @plans.published.includes([:schedules, :category, :prefecture, :city, :spot, :tags])
      .where(['plans.plan_title LIKE ? OR plans.content LIKE ? OR schedules.schedule_title LIKE ? OR schedules.content LIKE ? OR categories.category LIKE ? OR prefectures.name LIKE ? OR cities.name LIKE ? OR spots.name LIKE ? OR tags.name LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]).references([:schedules, :category, :prefecture, :city, :spot, :tags])
      end
    end
    @plans = @plans.published.order("time DESC").page(params[:page]).per(20)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.account_activation(@user).deliver_now
      redirect_to register_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to mypage_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end
  
  def edit_profile
    @user = User.find(params[:id])
  end

  def update_profile
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'アカウント情報を更新しました'
      UserMailer.edit_profile(@user).deliver_now
      redirect_to edit_profile_path
    else
      flash.now[:danger] = '入力に誤りがあります、もう一度入力してください'
      render :edit_profile
    end
  end
  
  def popular
    @users = User.order("rand()").page(params[:page]).per(30).limit(100)
  end
  
  def likes
    @user = User.find(params[:id])
    @favplans = @user.favplans.page(params[:page]).per(20).reverse_order
    counts(@user)
    
    if params[:search] == ""
      @favplans = @user.favplans.order("time DESC").page(params[:page]).per(20)
    else
      searches = params[:search].to_s.split(/[[:blank:]]+/).select(&:present?)
      @favplans = @user.favplans
      searches.each do |search|
      @favplans = @favplans.published.includes([:schedules, :category, :prefecture, :city, :spot, :tags])
      .where(['plans.plan_title LIKE ? OR plans.content LIKE ? OR schedules.schedule_title LIKE ? OR schedules.content LIKE ? OR categories.category LIKE ? OR prefectures.name LIKE ? OR cities.name LIKE ? OR spots.name LIKE ? OR tags.name LIKE ?',
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"]).references([:schedules, :category, :prefecture, :city, :spot, :tags])
      end
    end
    @favplans = @favplans.order("time DESC").page(params[:page]).per(20)
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(20)
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(20)
    counts(@user)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :catchphrase, :introduce, :image, :remove_image, :user_id)
  end
  
  def correct_user
      @user = User.find(params[:id])
      unless current_user.admin?
        redirect_to(root_url) unless @user == current_user
      end
  end
  
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
  def devise_variant
      case request.user_agent
      when /iPhone/
        request.variant = :mobile
      when /android/
        request.variant = :android
      end
  end
  
end
