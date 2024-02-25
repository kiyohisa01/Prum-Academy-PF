class AddSkillToSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :skills, :month, :integer
    add_column :skills, :year, :integer
  end
end
