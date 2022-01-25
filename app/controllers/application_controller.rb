class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  protected

  def after_sign_out_path_for(_scope)
    root_path
  end

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :surname, :email, :password, :posts_counter, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end
end
