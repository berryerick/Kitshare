class ApplicationController < ActionController::Base
  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil
  end
  def require_correct_user
    if User.where(:id => params[:id]).count == 1
      user = User.find(params[:id])
      redirect_to '/users/#{session[:user_id]}' if session[:user_id] == user
    else
      redirect_to '/users/new'
    end

  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
