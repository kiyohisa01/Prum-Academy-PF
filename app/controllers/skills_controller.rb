class SkillsController < ApplicationController
    
    def new
    end

    def index
        # ▼　条件別のデータ一覧取得
        @skills_back = Skill.where(engineer_role: "バックエンド")
        @skills_front = Skill.where(engineer_role: "フロントエンド")
        @skills_infra = Skill.where(engineer_role: "インフラ")

        # ▼　今月の整数を取得
        @this_month= Date.today.month
        # ▼　先月の整数を取得
        @last_month= if @this_month == 1
                12
            else
                @this_month - 1
            end
        # ▼　先々月の整数を取得
        @two_month= if @last_month == 1
                12
            else
                @last_month - 1
            end
        # ▼　プルダウンに表示する配列を作成
        @two_months =  [@this_month, @last_month, @two_month]
    end

    def skill_create_back
        @month = params[:month]
        @engineer_role = "バックエンド"
    end
    def skill_create_front
        @engineer_role = "フロントエンド"
    end
    def skill_create_infra
        @engineer_role = "インフラ"
    end

    def create
        @skill = Skill.new(skill_params)
        @skill.save
        redirect_to "/skills"
    end

    def show
    end

    def skill
        @skill = Skill.find(params[:id])
      end
    
      def update
        @skill = Skill.find(params[:id])
        redirect_to skills_url
      end

    def destroy
        skill = Skill.find(params[:id]).destroy
        skill.destroy
        redirect_to skills_url
    end

    private
    def skill_params
      params.require(:skill).permit(:skill, :engineer_role)
    end
        
end

