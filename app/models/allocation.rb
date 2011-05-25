# == Schema Information
# Schema version: 20110525194833
#
# Table name: allocations
#
#  id            :integer         not null, primary key
#  supervisor_id :integer
#  student_id    :integer
#  session       :string(255)     default("2011-2012")
#  round         :integer         default(1)
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  comment       :string(255)
#

class Allocation < ActiveRecord::Base
  belongs_to :project
  belongs_to :student
  belongs_to :supervisor
end
