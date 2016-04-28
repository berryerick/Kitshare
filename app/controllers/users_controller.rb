class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = User.last.id
      redirect_to kits_path
    else
      flash[:registration_errors] = user.errors.full_messages
      redirect_to :back
    end

  end

  def show
    @my_kits = User.find(session[:user_id]).kits
    @categories = Category.all
    @user = User.find(session[:user_id])
    @liked = Like.where(user_id: session[:user_id])


  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation)
  end
end
