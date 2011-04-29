require 'spec_helper'

describe HelpController do

  describe "GET 'help#index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
      response.should render_template('help/index')
    end
    
  end
end
