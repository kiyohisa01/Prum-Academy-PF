class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.string :engineer_role
      t.string :skill

      t.timestamps
    end
  end
end
