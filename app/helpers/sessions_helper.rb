module SessionsHelper

  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  #ユーザのセッションを永続てきにする
  def remember(user)
    user.remember  #user.rbのrememberを呼び出す
    #signedは[:user_id]を暗号化複合化しcookiesに焼き付ける
    cookies.permanent.signed[:user_id] = user.id
    #permantは期限を20年に設定
    cookies.permanent[:remember_token] = user.remember_token #一時的に覚えている
  end

  def current_user
    # DBへの問い合わせの数を減らしたい
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  #現在のユーザーをログアウトする
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  #永続的にセッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

end