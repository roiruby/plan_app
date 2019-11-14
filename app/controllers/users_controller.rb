class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(30).limit(100)
  end

  def show
    @user = User.find(params[:id])
    @plans = Plan.find_by(id: params[:id])
    @user_plans = @user.plans.page(params[:page]).per(20).reverse_order
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'ユーザを登録しました。'
      redirect_to mypage_path
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
      flash[:success] = '正常に更新されました'
      redirect_to mypage_path
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end


  def destroy
  end
  
  def likes
    @user = User.find(params[:id])
    @favplans = @user.favplans.page(params[:page])
    counts(@user)
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :catchphrase, :introduce, :image, :remove_image, :user_id)
  end
  
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end
  
end
