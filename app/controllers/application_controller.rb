class ApplicationController < ActionController::Base
  include SessionsHelper
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
  end

  def logged_in?
    current_user.present?
  end

  def require_login
   unless logged_in?
    store_location
    flash[:danger] = "Please log in to continue."
    redirect_to login_path, status: :see_other
   end
  end
  
  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
     end
   end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end


