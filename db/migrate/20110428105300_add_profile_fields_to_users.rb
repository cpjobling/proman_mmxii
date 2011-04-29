class AddProfileFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :initials, :string
    add_column :users, :last_name, :string
    add_column :users, :known_as, :string
  end

  def self.down
    remove_column :users, :known_as
    remove_column :users, :last_name
    remove_column :users, :initials
    remove_column :users, :first_name
    remove_column :users, :title
  end
end
