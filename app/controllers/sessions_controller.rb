class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)

      if params.dig(:session, :remember_me) == '1'
        remember(user)
      else
        forget(user)
        redirect_to user, notice: "Logged in!"
      end

      redirect_to user, notice: "Logged in!"

    else flash.now[:alert] = "Invalid email/password"
      render new, status: :unprocessable_entity
  end
end

  def destroy
    log_out if logged_in?
    redirect_to login_path, notice: "Logged out!"
  end

  if params[:session][:remember_me] == '1'
      user.remember
      cookies.permanent.encrypted[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    else
      forget(user)
    end
end