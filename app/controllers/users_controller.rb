class UsersController < ApplicationController

  def new
    puts "■■new■■"
  end

  def create
    puts "■■create■■"
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save 
      puts "■■create_if■■"
      reset_session
      log_in @user
      redirect_to @user
    else
      puts "■■create_else■■"
      # ▼　保存の失敗
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    puts "■■edit■■"
    @user = User.find(params[:id])
  end

  def skill
    @user = User.find(params[:id])
  end

  def update
    puts "■■UPDATE■■"
    @user = User.find(params[:id])
    if @user.update(user_params)
      puts "■■UPDATE_if■■"
      redirect_to user_path
    else
      puts "■■UPDATE_else■■"
      flash[:alert] = "保存に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    puts "■■show■■"
    @user = User.find(params[:id])

    # 月と年の値を取得
    @this_month= Date.today.month
    @this_year= Date.today.year
    @last_month= if @this_month == 1
        12
      else
        @this_month - 1
      end
    @last_month_year = if @this_month == 1
        @this_year - 1
      else
        @this_year
      end
    @two_month= if @this_month == 1
        11
      elsif @this_month == 2
        12
      else
        @this_month - 2
      end
    @two_month_year= if @last_month == 1
        @this_year - 1
      elsif @last_month == 2
        @this_year - 1
      else
        @this_year
      end
    
      # 今月の各ロールの学習時間合計（jsに渡す変数）
    @this_month_learnings_back_sum = Learning.where(user_id: current_user.id, month: @this_month, year: @this_year, engineer_role: "バックエンド").pluck(:learning_time).sum
    @this_month_learnings_front_sum = Learning.where(user_id: current_user.id, month: @this_month, year: @this_year, engineer_role: "フロントエンド").pluck(:learning_time).sum
    @this_month_learnings_infra_sum = Learning.where(user_id: current_user.id, month: @this_month, year: @this_year, engineer_role: "インフラ").pluck(:learning_time).sum
    gon.this_month_learnings_back_sum = @this_month_learnings_back_sum 
    gon.this_month_learnings_front_sum = @this_month_learnings_front_sum
    gon.this_month_learnings_infra_sum = @this_month_learnings_infra_sum

    # 先月の各ロールの学習時間合計（jsに渡す変数）
    @last_month_learnings_back_sum = Learning.where(user_id: current_user.id, month: @last_month, year: @last_month_year, engineer_role: "バックエンド").pluck(:learning_time).sum
    @last_month_learnings_front_sum = Learning.where(user_id: current_user.id, month: @last_month, year: @last_month_year, engineer_role: "フロントエンド").pluck(:learning_time).sum
    @last_month_learnings_infra_sum = Learning.where(user_id: current_user.id, month: @last_month, year: @last_month_year, engineer_role: "インフラ").pluck(:learning_time).sum
    gon.last_month_learnings_back_sum = @last_month_learnings_back_sum 
    gon.last_month_learnings_front_sum = @last_month_learnings_front_sum
    gon.last_month_learnings_infra_sum = @last_month_learnings_infra_sum

    # 先々月の各ロールの学習時間合計（jsに渡す変数）
    @two_month_learnings_back_sum = Learning.where(user_id: current_user.id, month: @two_month, year: @two_month_year, engineer_role: "バックエンド").pluck(:learning_time).sum
    @two_month_learnings_front_sum = Learning.where(user_id: current_user.id, month: @two_month, year: @two_month_year, engineer_role: "フロントエンド").pluck(:learning_time).sum
    @two_month_learnings_infra_sum = Learning.where(user_id: current_user.id, month: @two_month, year: @two_month_year, engineer_role: "インフラ").pluck(:learning_time).sum
    gon.two_month_learnings_back_sum = @two_month_learnings_back_sum 
    gon.two_month_learnings_front_sum = @two_month_learnings_front_sum
    gon.two_month_learnings_infra_sum = @two_month_learnings_infra_sum
    # 以下失敗
      # @two_month_learnings_back_sum = 0
      # @two_month_learnings_front_sum = 0
      # @two_month_learnings_infra_sum = 0
      # @two_month_learnings.each do |t|
      #   if t.engineer_role == "バックエンド"
      #     @two_month_learnings_back_sum += t.learning_time
      #   elsif t.engineer_role == "フロントエンド"
      #     @two_month_learnings_front_sum += t.learning_time
      #   else
      #     @two_month_learnings_infra_sum += t.learning_time
      # end
      # gon.two_month_learnings_back_sum = @two_month_learnings_back_sum
      # gon.two_month_learnings_front_sum = @two_month_learnings_front_sum
      # gon.two_month_learnings_infra_sum = @two_month_learnings_infra_sum
  
  end

  def index
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation, :introduce)
    end
    
end

