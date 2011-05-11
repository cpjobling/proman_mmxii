require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
      :email => "C.P.Jobling@swansea.ac.uk",
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
      "c.p.joblingR@swansea.ac.uk",
      "123456@Swansea.ac.uk",
      "c.p.jobling@Swansea.ac.uk",
      "123456@swan.ac.uk",
      "c.p.jobling@swan.ac.uk",
      "123456@Swan.ac.uk",
      "c.p.jobling@Swan.ac.uk",
      "c.p.jobling@abertawe.ac.uk", 
      "123456@abertawe.ac.uk",
      "c.p.jobling@Abertawe.ac.uk",
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
      @user.user_name.should == "c.p.jobling"
    end
  
    it "should have a user name that is the email address without the domain" do
      @user.user_name.should == @attr[:email].split('@').first.downcase
    end
  
    it "should have a readonly user name" do
      @user.user_name = 'another_name'
      @user.save!
      @user.user_name.should == "c.p.jobling"
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
    
end
