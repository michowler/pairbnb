class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def logged_in_user
     unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to sign_in_url
     end
  end
end