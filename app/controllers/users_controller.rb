class UsersController < ApplicationController
  def new
  end

  def create
    # @user = User.new(params[:user])
    # if @user.save # 保存の成功をここで扱う。
    # else
    #   render 'new', status: :unprocessable_entity
    # end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def show
    # @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

end
