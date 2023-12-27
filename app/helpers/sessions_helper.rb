module SessionsHelper

    # 渡されたユーザーでログインするメソッド
  def log_in(user)
    session[:user_id] = user.id
  end

   # ▼　渡されたユーザーでログインしているか確認するメソッド
  def logged_in?
    !current_user.nil?
  end

   # ▼　cookieに保存されているユーザーidを削除するメソッド
  def log_out
    reset_session
    @current_user = nil
  end

   # ▼　cookieに保存されているログイン中のユーザー情報を返すメソッド
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
