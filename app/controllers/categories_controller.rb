class CategoriesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @my_kits = User.find(session[:user_id]).kits
    @user = User.find(session[:user_id])
    @categories = Category.all
    @kits = Kit.where(category_id: params[:id]).joins(:user).select("*, kits.id as kit_id, users.id as user_id")
    @liked = Like.where(user_id: session[:user_id])
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
