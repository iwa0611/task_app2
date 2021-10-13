class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def sign_in
    @user = User.find(params[:emai])
    if @user
      flash[:notice] = "ログインしました"
      redirect_to "/"
    else
      render "sign_in"
    end
  end
  
  def sign_up
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to action: :profile
    else
      render "sign_up"
    end
  end
  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user
      binding.pry
      if @user.update(params.require(:user).permit(:name,:introduction,:image))
        flash[:notice] = "更新しました"
        redirect_to "/users/profile"
      else
        flash[:notice] = "更新できませんでした"
        render "users/profile"
      end
    else
      redirect_to "/"
    end
  end
  
  def profile
    @user = User.find_by(id: session[:user_id])
  end
  
  
  private
  
  def params_user
    params.require(:user).permit(:name,:email,:password)
  end
  
end
