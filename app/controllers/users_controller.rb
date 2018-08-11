class UsersController < ApplicationController
  before_action :require_login, only:[:index, :edit, :update, :destroy]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only:[:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to topics_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
  end
 end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @topics = @user.topics.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path, success: '更新しました'
    else
      render 'edit'
  end
end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "消去されました"
    redirect_to users_url
  end

 private
 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end

 def log_in(user)
   session[:user_id] = user.id
 end

 def require_login
   unless logged_in?
     flash[:danger] = "please log in"
     redirect_to login_url
   end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to login_path unless @user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin
  end
end
