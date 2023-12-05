class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      # 保存の成功
      redirect_to @user
    else
      # 保存の失敗
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end
