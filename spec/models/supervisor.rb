require 'spec_helper'

describe Supervisor do

  before(:each) do
    @supervisor = Factory(:supervisor)
  end
  
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
end