class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  protect_from_forgery
  
  def index
    @users = User.all
  end
  
  def account
    @user = User.find_by(id: session[:user_id])
  end
  
  def account_update
    @user = User.find_by(email: params[:session][:email])
    password_check
    unless flash[:notice]
      if @user.update(params.permit(:email, :password))
        flash[:notice] = "更新しました"
        redirect_to "/users/account"
      else
        flash[:notice] = "更新できませんでした"
        render "users/edit"
      end
    else
      redirect_to "/users/edit"
    end
  end
  
  def sign_up
    @user = User.new
  end
  
  def create
    @user = User.new(params_user)
    if @user.save && params[:password] == params[:check_password]
      log_in @user
      flash[:notice] = "アカウント作成しました"
      redirect_to "/users/profile"
    else
      flash[:notice] = "アカウント作成に失敗しました"
      render "sign_up"
    end
  end
  
  def edit
    @user = User.find_by(id: session[:user_id])
  end
  

  def update
    @user = User.find_by(id: session[:user_id])
    if current_user == @user
      if @user.update(params.require(:user).permit(:name, :introduction, :image))
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
    params.permit(:name,:email,:password)
  end
  
  # 登録パスワードと一致するか確認
  # 新しいパスワードと確認用パスワードが一致するか確認
  def password_check
    if @user.authenticate(params[:session][:password])
      if current_user == @user && params[:session][:new_password] == params[:session][:check_password]
        params[:password] = params[:session][:new_password]
      else
        flash[:notice] = "確認用パスワードが一致しません"
      end
    else
      flash[:notice] = "パスワードが違います"
    end
  end  
  
end
