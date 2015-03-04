class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from User::NotAuthorizedError do |e|
    sign_out current_user
    flash[:error] = "You are not authorized to view this page"
    redirect_to new_user_session_path
  end

  def require_admin!
    raise User::NotAuthorizedError unless current_user.admin?
  end
end
