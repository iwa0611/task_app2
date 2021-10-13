class SessionsController < ApplicationController
  def new
  end
  
  def create # sessionの中にemailが入っているparams{session:{email}}
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password_digest])
      log_in user
      redirect_to "/users/profile"
    else
      render "users/sign_in_page"
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to "/"
  end
end
