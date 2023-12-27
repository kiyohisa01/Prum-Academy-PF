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
      # ▼　保存の失敗
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def skill
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    @skills = @user.skills
  end

  def index
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password)
    end

end
