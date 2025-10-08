class ApplicationController < ActionController::Base
  include SessionsHelper

 def new; end

 def create
  user = User.find_by(email: params[:session][:email].downcase)
   if user&.authenticate(params[:session][:password])
    session[:user_id] = user.id
    redirect_to user, notice: "Logged in!"
   else
    flash.now.alert = "Email or password is invalid"
    render "new", status: :unprocessable_entity
   end
  end

  def destroy
   session.delete(:user_id)
   redirect_to root_url, notice: "Logged out!"
  end
  
  private

  def logged_in_user
   unless logged_in?
    store_location
   flash[:danger] = "Please log in."
   redirect_to login_url
  end
end
end


