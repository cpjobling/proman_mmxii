require 'spec_helper'

describe Supervisor do

  before(:each) do
    @supervisor = Factory(:supervisor)
  end
  
  context "Newly created supervisor record" do
    it "should be a user" do
      user = User.find(@supervisor)
      user.should_not be_nil
      user.id.should == @supervisor.id
      user.should be_a User
    end
  
    it "should be a supervisor" do
      @supervisor.should be_a Supervisor
    end
  
    it "should not be a student" do
      @supervisor.should_not be_a Student
    end
  
    it "should be possible to make a user into a supervisor" do
      user = Factory(:user)
      user[:type] = 'Supervisor'
      user[:type].should == "Supervisor"
      student = Student.find(user.id)
      student.should_not be_nil
      student.should be_a Supervisor
    end
  
    it "should have the :academic role" do
      @supervisor.should have_role :academic
    end
    
    it "should not have the :undergraduate role" do
      @supervisor.should_not have_role :undergraduate
    end
  
    it "should not have the administrator, coordinator or admin roles" do
      @supervisor.should_not have_role :administrator
      @supervisor.should_not have_role :coordinator
      @supervisor.should_not have_role :admin
    end
  end
end