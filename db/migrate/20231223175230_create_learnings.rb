class CreateLearnings < ActiveRecord::Migration[7.0]
  def change
    create_table :learnings do |t|
      t.integer :learning_time
      t.integer :month

      t.timestamps
    end
  end
end
