class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save 
      reset_session
      log_in @user
      redirect_to @user
    else
      # 保存の失敗
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to @user
    # @user.avatar.attach(params[:user][:avatar])
    # # current_user.update(update_params)
    # # @user.avatar.attach(params[:user][:avatar]) if @user.avatar.blank? # 画像未選択で画像が消えないようにする
    # @user = User.find(params[:id])
    # if @user.update(user_params)
    #   # 更新に成功した場合
    # else
    #   # 更新に失敗した場合
    #   render 'edit', status: :unprocessable_entity
    # end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password)
    end

end
