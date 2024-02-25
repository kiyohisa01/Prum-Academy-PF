class AddLearningToLearnings < ActiveRecord::Migration[7.0]
  def change
    add_column :learnings, :year, :integer
    add_column :learnings, :engineer_role, :string
    add_column :learnings, :skill, :string
  end
end
