class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    redirect_to edit_user_registration_path
  end

end
