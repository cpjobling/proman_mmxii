# == Schema Information
# Schema version: 20110428105300
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
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :confirmable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :first_name, :last_name, :title, :initials, :known_as
  
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :case_sensitive => false
  validates_format_of :email, :with => /\A.+@(swan|abertawe|swansea)\.ac\.uk\z/, :message => "Email is invalid: must be a Swansea University email address."
  
  def email=(email)
    write_attribute(:email, email)
    user_name = email.split('@').first.downcase
    write_attribute(:user_name, user_name)
  end
  
  def email
    read_attribute(:email)
  end
  
  def user_name
    read_attribute(:user_name)
  end
  
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
end
