class RemoveLearningFromLearnings < ActiveRecord::Migration[7.0]
  def change
    remove_column :learnings, :skill_id, :integer
  end
end
