class PagesController < ApplicationController
  
  def home
    @users = User.all
  end

  def about
  end
  
  def contact
  end
  
  def help
  end
  
  def tos
  end
  
  def license
  end

end
