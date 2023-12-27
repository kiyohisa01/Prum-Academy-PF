class AddUserIdToLearnings < ActiveRecord::Migration[7.0]
  def change
    add_column :learnings, :user_id, :integer
  end
end
