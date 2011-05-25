require 'spec_helper'

describe Student do

  before(:each) do
    @student = Factory(:student)
  end
  
  it "should be a user" do
    user = User.find(@student)
    user.should_not be_nil
    user.id.should == @student.id
    user.should be_a User
  end
  
  it "should be a student" do
    @student.should be_a Student
  end
  
  it "should not be a supervisor" do
    @student.should_not be_a Supervisor
  end
  
  it "should be possible to make a user into a student" do
    user = Factory(:user)
    user[:type] = 'Student'
    user[:type].should == "Student"
    student = Student.find(user.id)
    student.should_not be_nil
    student.should be_a Student
  end
end
