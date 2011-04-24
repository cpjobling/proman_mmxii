require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
      response.should render_template('pages/home')
    end
    
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
      response.should render_template('pages/about')
    end
  end
  
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
      response.should render_template('pages/contact')
    end
    
  end
  
  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
      response.should render_template('pages/help')
    end
    
  end
  
  describe "GET 'tos'" do
    it "should be successful" do
      get 'tos'
      response.should be_success
      response.should render_template('pages/tos')
    end
    
  end
  
  describe "GET 'license'" do
    it "should be successful" do
      get 'license'
      response.should be_success
      response.should render_template('pages/license')
    end    
  end
end
