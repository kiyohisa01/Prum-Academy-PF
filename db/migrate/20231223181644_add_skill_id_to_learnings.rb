class AddSkillIdToLearnings < ActiveRecord::Migration[7.0]
  def change
    add_column :learnings, :skill_id, :integer
  end
end
