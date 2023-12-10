class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザーページへ移動
      reset_session      # ログインの直前に必ずこれを書くこと
      log_in user
      redirect_to user
    else
      # 保存の失敗　 エラーメッセージ
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

end
