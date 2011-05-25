# == Schema Information
# Schema version: 20110525192823
#
# Table name: projects
#
#  id            :integer         not null, primary key
#  title         :string(255)
#  description   :text
#  suitable_for  :string(255)
#  proposed_by   :integer
#  allocation_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Project < ActiveRecord::Base
  attr_accessible :title, :description, :suitable_for, :proposed_by, :allocation_id
  
  belongs_to :proposer, :class_name => "Supervisor", :foreign_key => :proposed_by

  belongs_to :allocation
  belongs_to :student, :class_name => "Allocation", :foreign_key => :student_id
  belongs_to :supervisor, :class_name => "Allocation", :foreign_key => :supervisor_id
end
