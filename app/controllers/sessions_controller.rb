class SessionsController < ApplicationController
  
  def new
  end

  # ▼　情報を受け取り、ログイン処理
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ▼　ログイン後にユーザーページへ移動
      reset_session      # ◀　ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to user
    else
      # ▼　保存の失敗　 エラーメッセージ
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

   # ▼　cookieに保存されているユーザーidを削除するアクション
  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end

end
