class SkillsController < ApplicationController

    def new
        @learning = Learning.new
    end

    def create
        @learning = Learning.new(learning_params)
        if @learning.save
            flash[:notice] = "保存に成功しました"
            redirect_to "skills/index"
        else
            flash[:alert] = "保存に失敗しました"
            redirect_to @learning
        end
    end

    def show
        @skill = Learning.find(params[:id])
    end

    def index
        # ▼　今月の整数を取得
        @this_month= Date.today.month
        @this_year= Date.today.year
        # ▼　先月の整数を取得
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
        # ▼　先々月の整数を取得
        @two_month= if @this_month == 1
                11
            elsif @this_month == 2
                12
            else
                @last_month - 1
            end
        @two_month_year= if @last_month == 1
                @this_year - 1
            elsif @last_month == 2
                @this_year - 1
            else
                @this_year
            end
         
        
        # ▼　今月のデータ一覧
        @this_month_role_back = Learning.where(engineer_role: "バックエンド").where(user_id: current_user.id).where(month: Date.today.month).where(year: Date.today.year)
        @this_month_role_front = Learning.where(engineer_role: "フロントエンド").where(user_id: current_user.id).where(month: Date.today.month).where(year: Date.today.year)
        @this_month_role_infra = Learning.where(engineer_role: "インフラ").where(user_id: current_user.id).where(month: Date.today.month).where(year: Date.today.year)
        # ▼　先月のデータ一覧
        @last_month_role_back = Learning.where(engineer_role: "バックエンド").where(user_id: current_user.id).where(month: @last_month).where(year: @last_month_year)
        @last_month_role_front = Learning.where(engineer_role: "フロントエンド").where(user_id: current_user.id).where(month: @last_month).where(year: @last_month_year)
        @last_month_role_infra = Learning.where(engineer_role: "インフラ").where(user_id: current_user.id).where(month: @last_month).where(year: @last_month_year)
        # ▼　先々月のデータ一覧
        @two_month_role_back = Learning.where(engineer_role: "バックエンド").where(user_id: current_user.id).where(month: @two_month).where(year: @two_month_year)
        @two_month_role_front = Learning.where(engineer_role: "フロントエンド").where(user_id: current_user.id).where(month: @two_month).where(year: @two_month_year)
        @two_month_role_infra = Learning.where(engineer_role: "インフラ").where(user_id: current_user.id).where(month: @two_month).where(year: @two_month_year)
        # ▼　プルダウンに表示する配列を作成
        @this_month_word = "#{@this_month}月"
        @last_month_word = "#{@last_month}月"
        @two_month_word = "#{@two_month}月"
        @two_months =  [[@this_month_word,1], [@last_month_word,2], [@two_month_word,3]]
    end

    def skill_create_back_this_month
        @learning = Learning.new
        @month = Date.today.month
        @year = Date.today.year
        @engineer_role = "バックエンド"
    end

    def skill_create_back_last_month
        @learning = Learning.find(learning_params)
        @this_month= Date.today.month
        @month = if @this_month == 1
                12
            else
                @this_month - 1
            end
        @this_year= Date.today.year
        @year = if @this_month == 1
                @this_year - 1
            else
                @this_year
            end
        @engineer_role = "バックエンド"
    end

    def skill_create_back_two_month
        @learning = Learning.find(learning_params)
        @this_month = Date.today.month
        @last_month = if @this_month == 1
                12
            else
                @this_month - 1
            end
        @month = if @last_month == 1
                11
            elsif @last_month == 2
                12
            else
                @last_month - 1
            end
        @this_year= Date.today.year
        @year= if @last_month == 1
                @this_year - 1
            elsif @last_month == 2
                @this_year - 1
            else
                @this_year
            end
        @engineer_role = "バックエンド"
    end

    def skill_create_front_this_month
        @learning = Learning.find(learning_params)
        @month = Date.today.month
        @year = Date.today.year
        @engineer_role = "フロントエンド"
    end

    def skill_create_front_last_month
        @learning = Learning.find(learning_params)
        @this_month= Date.today.month
        @month = if @this_month == 1
                12
            else
                @this_month - 1
            end
        @this_year= Date.today.year
        @year = if @this_month == 1
                @this_year - 1
            else
                @this_year
            end
        @engineer_role = "フロントエンド"
    end

    def skill_create_front_two_month
        @learning = Learning.find(learning_params)
        @this_month = Date.today.month
        @last_month = if @this_month == 1
                12
            else
                @this_month - 1
            end
        @month = if @last_month == 1
                11
            elsif @last_month == 2
                12
            else
                @last_month - 1
            end
        @this_year= Date.today.year
        @year= if @last_month == 1
                @this_year - 1
            elsif @last_month == 2
                @this_year - 1
            else
                @this_year
            end
        @engineer_role = "フロントエンド"
    end

    def skill_create_infra_this_month
        @learning = Learning.find(learning_params)
        @month = Date.today.month
        @year = Date.today.year
        @engineer_role = "インフラ"
    end

    def skill_create_infra_last_month
        @learning = Learning.find(learning_params)
        @this_month= Date.today.month
        @month = if @this_month == 1
                12
            else
                @this_month - 1
            end
        @this_year= Date.today.year
        @year = if @this_month == 1
                @this_year - 1
            else
                @this_year
            end
        @engineer_role = "インフラ"
    end

    def skill_create_infra_two_month
        @learning = Learning.find(learning_params)
        @this_month = Date.today.month
        @last_month = if @this_month == 1
                12
            else
                @this_month - 1
            end
        @month = if @last_month == 1
                11
            elsif @last_month == 2
                12
            else
                @last_month - 1
            end
        @this_year= Date.today.year
        @year= if @last_month == 1
                @this_year - 1
            elsif @last_month == 2
                @this_year - 1
            else
                @this_year
            end
        @engineer_role = "インフラ"
    end

    def edit
        @skill = Learning.find(params[:id])
    end

    def update
        @skill = Learning.find(params[:id])
        if @skill.update(skill_params)
            redirect_to skills_url
        else
            flash[:alert] = "保存に失敗しました"
            render :new
        end
    end

    def destroy
        skill = Learning.find(params[:id])
        if skill.user_id == current_user.id
            skill.destroy
            flash[:notice] = "削除しました"
            redirect_to skill_path
        else
            flash.now[:danger] = "削除に失敗しました"
            render 'index'
        end
    end

    private
    def learning_params
      params.require(:learning).permit(:learning_time, :user_id, :month, :year, :engineer_role, :skill)
    end
        
end

