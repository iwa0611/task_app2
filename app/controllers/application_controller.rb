class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  
  # ログイン済みユーザーかどうか確認 unlessはifの反対
  def logged_in_user
    unless logged_in?
      redirect_to "/users/sign_in_page"
    end
  end
end
