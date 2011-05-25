# == Schema Information
# Schema version: 20110522145729
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
#

# given a User class with a roles_mask attribute
require 'rubygems'
require 'role_model'

class User < ActiveRecord::Base
  before_save :generate_user_name, :set_default_role
  
  
  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :title, :initials, :known_as, :roles
    
  attr_readonly :user_name
  attr_readonly :email
  
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A.+@(swan|abertawe|swansea)\.ac\.uk\z/, :message => "Email is invalid: must be a Swansea University email address."
  
  # Return true if the user's password is valid
  def has_password?(submitted_password)
    valid_password?(submitted_password)
  end

  # Returns the user if password is correct
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def full_name
    full_name = [title, first_name, initials, last_name].join(' ').strip().sub(/\s{2,}/, ' ')
  end
  
  # User roles
  include RoleModel
  roles_attribute :roles_mask
  roles :user, :admin, :supervisor, :coordinator, :administrator, :student, :supervisee
  def guest?
    self.roles.empty?
  end
  
  def user?
    self.is?(:user)
  end
  
  def admin?
    self.is?(:admin)
  end
  
  protected
    def generate_user_name
       user_name = email.split('@').first
       write_attribute(:user_name, user_name)
    end
      
    def self.find_for_database_authentication(conditions)
      self.where(:user_name => conditions[:email]).first || self.where(:email => conditions[:email]).first
    end
    
    def set_default_role
      self.roles << [:user]
    end
end
