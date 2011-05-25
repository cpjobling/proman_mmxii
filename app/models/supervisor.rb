# == Schema Information
# Schema version: 20110525161632
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  authentication_token   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  user_name              :string(255)
#  title                  :string(255)
#  first_name             :string(255)
#  initials               :string(255)
#  last_name              :string(255)
#  known_as               :string(255)
#  roles_mask             :integer         default(0)
#  type                   :string(255)
#

class Supervisor < User
  has_many :students, :through => :allocations
  has_many :projects
end
