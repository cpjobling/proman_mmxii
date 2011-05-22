require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user, :known_as => 'Fred')
      @user.confirm!
      sign_in @user
    end

    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user.id
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
        page.should have_selector("h2", :content => @user.full_name)
      end
    
      it "should include the user's email" do
        page.should have_selector("p", :content => @user.email)
      end
    
    
      it "should include the user's preferred name" do
        page.should have_selector("p", :content => @user.known_as)
      end

      it "should have a profile image" do
        page.should have_selector("h2>img", :class => "gravatar")
      end
    end
  end
  
  describe "GET 'edit'" do

      before(:each) do
        @user = Factory(:user)
        @user.confirm!
        sign_in @user
      end

      it "should redirect" do
        get :edit, :id => @user
        response.should redirect_to(edit_user_registration_path)
      end

    end
end