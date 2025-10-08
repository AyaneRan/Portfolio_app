class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params.dig(:session, :email)&.downcase)

    if user&.authenticate(params.dig(:session, :password))
      # ログイン（セッションに保存）
      session[:user_id] = user.id

      # ← ここで remember_me を判定（create の中！）
      if params.dig(:session, :remember_me) == '1'
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token]   = user.remember_token
      else
        # 念のため毎回クリア
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
        user.forget
      end

      redirect_to user, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email/password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # ログアウト時はCookieもセッションも消す
    if (uid = session[:user_id]) && (user = User.find_by(id: uid))
      user.forget
    end
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
end