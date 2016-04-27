class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: login_params[:email])[0]
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user[:id]
      redirect_to :root
    else
      flash[:messages] = "Invalid"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
  private
  def login_params
      params.require(:user).permit(:password, :email)
  end
end
