require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :email => "hector.somebody@swansea.ac.uk",
      :password => "foobar",
      :password_confirmation => "foobar",
      :first_name => "Test",
      :last_name => "Tester"
    }
  end

  # User name and email validations (see Chapter 6)
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it 'should require an email address' do
    no_name_user = User.new(@attr.merge(:email => ""))
    no_name_user.should_not be_valid
  end

  it 'should accept valid email addresses' do
    addresses = [
      "123456@swansea.ac.uk",
      "hector.somebodyR@swansea.ac.uk",
      "123456@Swansea.ac.uk",
      "hector.somebody@swansea.ac.uk",
      "123456@swan.ac.uk",
      "hector.somebody@swan.ac.uk",
      "123456@Swan.ac.uk",
      "hector.somebody@Swan.ac.uk",
      "hector.somebody@abertawe.ac.uk", 
      "123456@abertawe.ac.uk",
      "hector.somebody@Abertawe.ac.uk",
      "123456@Abertawe.ac.uk"
    ]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  describe "user name" do
    before(:each) do
      @user = User.new(@attr)
      @user.save!
    end
    
    it "should have a user name" do
      @user.user_name.should == "hector.somebody"
    end
  
    it "should have a user name that is the email address without the domain" do
      @user.user_name.should == @attr[:email].split('@').first.downcase
    end
  
    it "should have a readonly user name" do
      @user.user_name = 'another_name'
      @user.save!
      @user.user_name.should == "hector.somebody"
    end
  end
  
  it 'should reject invalid email addresses' do
    addresses = %w[user@foo.com user@gmail.com example@hotmail.com ]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  # Password form validations (See Chapter 7)
  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do # Devise minimum is 6
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do # Devise default maximum is 128
      long = "a" * 129 
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
  
  # User profile details
  describe "user profile features" do
    before(:each) do
      @user = User.new(@attr)
    end
    it "should respond to title" do
      @user.should respond_to(:title)
    end
    
    it "should respond to first name" do
      @user.should respond_to(:first_name)
    end
    
    it "should respond to last name" do
      @user.should respond_to(:last_name)
    end
    
    it "should respond to initials" do
      @user.should respond_to(:initials)
    end
    
    it "should respond to known as" do
      @user.should respond_to(:known_as)
    end
        
    it "should require first name" do
      @user.first_name = ""
      @user.should_not be_valid
    end
    
    it "should require last name" do
      @user.last_name=""
      @user.should_not be_valid
    end
  end

  # Password encryption
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end

    describe "has_password? method" do
      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
  end

  describe "authenticate method" do

    it "should return nil on email/password mismatch" do
      wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
      wrong_password_user.should be_nil
    end

    it "should return nil for email address with no user" do
      nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
      nonexistent_user.should be_nil
    end

    it "should return user on email/password match" do
      matching_user = User.authenticate(@attr[:email], @attr[:password])
      matching_user.should == @user
    end
  end
  
  describe "email attribute" do
    it "should be readonly" do
      user = User.create!(@attr)
      user.email = "another@swansea.ac.uk"
      user.save!
      user.reload
      user.email.should == @attr[:email]
    end
  end
  
  describe "full_name method" do
    before(:each) do
      @user = User.create!(@attr)
      @user.confirm!
    end
    it "should return the user's full name plus last name by default" do
      @user.full_name.should == @user.first_name + " " + @user.last_name
    end
    
    it "should include the user's title if it set" do
      @user.title = 'Dr'
      @user.full_name.should == 'Dr' + ' ' + @user.first_name + " " + @user.last_name
    end
    
    it "should include the user's initials if set" do
      @user.initials = 'T.'
      @user.full_name.should ==  @user.first_name + " T. " + @user.last_name
    end
    
    it "should be the complete name if all fields are present" do
      @user.title = 'Dr'
      @user.initials = 'T.'
      @user.full_name.should ==  'Dr' + ' ' + @user.first_name + " T. " + @user.last_name
    end
  end
  
  describe "user's role" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should be guest when not registered" do
      @user = User.new
      @user.roles.should be_empty
      @user.roles.size.should == 0
      @user.should be_guest
    end
    
    it "should be 'new user' when newly registered" do
      @user.should have_role(:user)
      @user.roles.size.should == 1
      @user.should be_user
      @user.should_not be_guest
    end
    
    it "should not be possible for unprivileged users to add new roles" do
      unprivileged_roles = User.valid_roles - [:admin, :administrator, :coordinator]
    end
    
    it "should not be possible unprivileged users to remove a role" do
      unprivileged_roles = User.valid_roles - [:admin, :administrator, :coordinator]
    end
    
    it "should not be possible for administrators and coordinators to add admin role" do
      [:administrator, :coordinator].each do |role|
       # @user.roles << role
       #  @user.should have_role(role)
       # email = "#{role.to_s}@swansea.ac.uk"
       # other_user = User.create!(@attr.merge(:email => email, :roles => [:admin]))
       # other_user.should_not be_admin
      end
    end
    
    it "should be possible to add administrators and coordinators to add new valid roles" do
      User.valid_roles.each do |role|
        @user.should have_role(:user)
        unless role == :user
          @user.should_not have_role(role)
          @user.roles << role
        end
        @user.should have_role(role)
      end
      @user.should have_all_roles(User.valid_roles)
      @user.save!
      @user.reload
      @user.should have_all_roles(User.valid_roles)
    end
    
    it "should be possible to remove a valid role" do
      @user.roles = User.valid_roles
      @user.should have_all_roles(User.valid_roles)
      @user.roles.each do |role|
        @user.roles.delete(role)
        @user.should_not have_role(role)
      end
      @user.should_not have_any_role(User.valid_roles)
      @user.save!
      @user.reload
      # :user role added on save!
      @user.should have_role(:user)
    end
    it "should not be possible to assign an undefined role" do
      %w[tinker, tailor, soldier. spy].each do |made_up_role|
        original_roles_mask = @user.roles_mask
        @user.roles << made_up_role
        @user.roles_mask.should == original_roles_mask
        @user.should_not have_role(made_up_role)
      end
    end
    
    it "should be possible to query all user's roles" do
      roles = []
      User.valid_roles.each do |role|
        roles << role
        @user.roles << role
        @user.should have_all_roles(roles)
        roles.each do |the_role|
          @user.should have_role(the_role)
        end
      end
    end
  end
  
  describe "roles_mask" do
    it "should be settable and readable" do
      u = User.new
      u.roles_mask.should == 0
      u.roles_mask = 1
      u.roles_mask.should == 1
    end
    it "shoud be persistent" do
      u = User.new(@attr)
      u.roles_mask = 1
      u.save!
      u.reload
      u.roles_mask.should == 1
    end
  end
  
  describe "known_as" do
    it "should be settable and readable" do
      u = User.new
      u.known_as.should be_nil
      u.known_as = 'fred'
      u.known_as.should == 'fred'
    end
    it "shoud be persistent" do
      u = User.new(@attr)
      u.known_as = 'fred'
      u.save!
      u.reload
      u.known_as.should == 'fred'
    end
  end
  
  
  describe "admin role" do
    before(:each) do
      @guest = User.new
      @user = Factory(:user)
      @admin = Factory(:admin)
    end
    it "should not be a role that guest user's have" do
      @guest.should_not have_role(:admin)
      @guest.should_not be_admin
    end
    
    it "should not be a role that new user's have" do
      @user.should_not have_role?(:admin)
      @user.should_not be_admin
    end
    
    it "admin users should have_role :admin" do
      @admin.should have_role(:admin)
    end
    
    it "admin users should respond positively to admin?" do
      @admin.should be_admin
    end
    
    it "should not be possible for admin user to remove role from himself" do
      @admin.should be_admin
      @admin.roles.delete(:admin)
      @admin.should be_admin
    end

    it "should be a role that only admin user's can add"

  end

  # Additional validations
  describe User do    
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should_not allow_mass_assignment_of(:type) }
    it { should_not allow_mass_assignment_of(:user_name) }
  end
end
