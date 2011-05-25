class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :suitable_for
      t.integer :proposed_by
      t.integer :allocation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
