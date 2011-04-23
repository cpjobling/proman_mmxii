require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
  
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end
  
  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end
  
  describe "GET 'tos'" do
    it "should be successful" do
      get 'tos'
      response.should be_success
    end
  end
  
  describe "GET 'license'" do
    it "should be successful" do
      get 'license'
      response.should be_success
    end
  end
  
  describe "GET ''" do
    it "should be successful" do
      get ''
      response.should be_success
    end
    
    it "should be same as home page"
  end
end
