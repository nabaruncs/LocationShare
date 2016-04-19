class ApplicationController < ActionController::Base
  layout :choose_layout
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!,        if: :devise_controller?

  protected
  def choose_layout
    return false if request.xhr?
    return params[:layout] if params[:layout].present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password, :name, :email)
    }

    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:name, :email, :password, :password_confirmation)
    }
  end

  def after_sign_in_path_for(user)
    default_redirect_path = root_path
    stored_location_for(resource) || default_redirect_path
  end
end
