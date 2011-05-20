require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
      @user.confirm!
      sign_in @user
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end  
    
    describe "the user page" do

      before(:each) do
        visit(user_path(@user))
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => 'please'
        click_button 'Sign in'
      end

      it "should have the right title" do
        page.should have_selector("title", :content => @user.full_name)
      end

      it "should include the user's full name" do
        page.should have_selector("h3", :content => @user.full_name)
      end
    
      it "should include the user's email" do
        page.should have_selector("h3", :content => @user.email)
      end
    
    
      it "should include the user's preferred name" do
        page.should have_selector("h3", :content => @user.email)
      end

      it "should have a profile image" do
        page.should have_selector("h3>img", :class => "gravatar")
      end
    end
  end
end