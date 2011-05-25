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
  has_one :allocation
  has_one :student, :class_name => Allocation, :foreign_key => :student_id
  has_one :supervisor, :class_name => Allocation, :foreign_key => :student_id
end
