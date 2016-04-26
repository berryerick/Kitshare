class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: login_params[:email])[0]
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user[:id]
      Session.
      redirect_to user_path session[:user_id]
    else
      flash[:messages] = "Invalid"
      redirect_to new_session_path
  end

  def destroy
  end
end
