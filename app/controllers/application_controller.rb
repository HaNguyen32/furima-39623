class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name,:encrypted_password, :email, :first_name, :last_name, :katagana_first_name, :katagana_last_name, :date_of_birth])
  end
end
