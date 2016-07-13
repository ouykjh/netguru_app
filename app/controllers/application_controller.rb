class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :unless => :devise_controller?

  decent_configuration { strategy DecentExposure::StrongParametersStrategy }

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      sanitized_params = %i(
        email
        password
        password_confirmation
      )
      u.permit(sanitized_params)
    end
  end
end
