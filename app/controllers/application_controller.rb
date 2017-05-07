class ApplicationController < ActionController::Base
  include Clearance::Controller
  
  protect_from_forgery with: :exception

  def logged_in_user
     unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to sign_in_url
     end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
          u.permit(:full_name, :email, 
          :password, :gender, :age, :avatar, :remove_avatar) 
    end
  end
end