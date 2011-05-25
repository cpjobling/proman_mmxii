require 'spec_helper'

describe Allocation do

  before(:each) do
    @supervisor = Factory(:supervisor)
    @student = Factory(:student)
    @student1 = Factory(:student, :email => "123654@swansea.ac.uk")
    @student2 = Factory(:student, :email => "123564@swansea.ac.uk")
  end
  
  describe "a valid allocation" do
    it "should have an associated project"
  
    it "should have round"
  
    it "should have a session"
    
    it "should have a student"
    
    it "should have a supervisor"
    
    it "projects should only be allocated once"
  end
  
  describe "project allocation" do
    
    context "allocation of a project to a student" do
  
      it "should allocate a student to single supervisor"
    
      it "should associate a supervisor to a group of supervisees"
      
      it "should list the supervisor's students"
 
      it "should define the student's supervisor"
    
    end
    
    context "after allocation" do
      it "should list the projects that have been allocated"
      it "should count the projects that have been allocated"
    end
  end
  
  describe "project dealocation" do
    
    it "should remove student from supervisor's students association"
    
    it "should remove student's supervisor association"
    
    it "should make the associated project free"
    
    it "should reduce the projects allocated count"
  end
  
  context "listing allocations by supervisor's research centre" do
  
  end
  
  context "listing allocations by student's discipline" do
    
  end
end