class AddCommentToAllocations < ActiveRecord::Migration
  def self.up
    add_column :allocations, :comment, :string
  end

  def self.down
    remove_column :allocations, :comment, :string
  end
end
