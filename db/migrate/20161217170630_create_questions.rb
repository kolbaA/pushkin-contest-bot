class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :task_id
      t.string :level
      t.string :question

      t.timestamps
    end
  end
end
