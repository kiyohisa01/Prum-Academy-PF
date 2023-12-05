class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザーページへ移動
    else
      # 保存の失敗　 エラーメッセージ
       render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

end
