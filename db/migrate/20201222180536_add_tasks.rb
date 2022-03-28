class AddTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :location
      t.string :deadline
      t.string :note
      t.integer :duration
      t.boolean :scheduled_event
      t.string :task_list,                      :default => ""
      t.string :completion_date,                :default => nil
      t.string :planned_completion_date,        :default => nil
      t.string :user_id,                        :default => ""
    end
  end
end
