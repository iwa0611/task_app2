module SessionsHelper
  
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # ログイン中のユーザーを返す
  def current_user
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    end # ↑元々||=と書いてあったがわからないので=に変更
  end
  
  # 受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_user?(user)
    user == curent_user
  end
  
  # ユーザーがログインしていればtrue
  # !でnilでない時にtrueを返している
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
