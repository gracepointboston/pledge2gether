class AddTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :task_lists do |t|
      t.string :name
      t.string :location
      t.string :note
      t.string :list_of_tasks
      t.string :user_id,                         :default => ""
    end
  end
end
