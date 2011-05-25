class CreateAllocations < ActiveRecord::Migration
  def self.up
    create_table :allocations do |t|
      t.integer :supervisor_id
      t.integer :student_id
      t.string :session, :size=>9, :default => "2011-2012"
      t.integer :round, :default => 1
      t.integer :project_id

      t.timestamps
    end
    add_index :allocations, :project_id, :unique => true
    add_index :allocations, :student_id, :unique => true
    add_index :allocations, :supervisor_id
  end

  def self.down
    drop_table :allocations
  end
end
