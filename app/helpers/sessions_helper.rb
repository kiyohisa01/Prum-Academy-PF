module SessionsHelper

    # 渡されたユーザーでログインする「log_inメソッド」
  def log_in(user)
    session[:user_id] = user.id
  end

end
