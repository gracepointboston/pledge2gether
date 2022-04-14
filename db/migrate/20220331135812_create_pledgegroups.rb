class CreatePledgegroups < ActiveRecord::Migration[7.0]
  def change
    create_table :pledgegroups do |t|
      t.text :admins           
      t.boolean :is_public,       :default => false
      t.text :pledges          
      t.integer :budget,          :default => 0
      t.decimal :amount_paid,     :default => 0.0

      t.timestamps
    end
  end
end
