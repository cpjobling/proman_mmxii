class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    @new_registrant = true
    redirect_to edit_user_registration_path
  end
  
  def after_update_path_for(resource)
    user_path(current_user)
  end

end
