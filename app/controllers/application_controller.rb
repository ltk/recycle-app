class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(user)
  #   reclaim_path
  # end

  def after_sign_in_path_for(resource)
    if current_admin
      dashboard_path
    else
      reclaim_path
    end
  end 

  def authenticate_admin!
    redirect_to new_admin_session_path, notice: 'Sorry only administrators can see view the dashboard.' unless current_admin
  end

   # custom 404
  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound,
                ActionController::RoutingError,
                ActionController::UnknownController,
                ActionController::UnknownAction,
                ActionController::MethodNotAllowed do |exception|

      # Put loggers here, if desired.

      redirect_to ohship_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :street1, :street2, :city, :state, :zipcode) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :password_confirmation, :first_name, :last_name, :street1, :street2, :city, :state, :zipcode) }
  end
  
end
