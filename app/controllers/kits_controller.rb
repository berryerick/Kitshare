class KitsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(session[:user_id])
    @my_kits = User.find(session[:user_id]).kits
    @categories = Category.all
    @all_kits = Kit.all.joins(:user).select("*, kits.id as kit_id")
  end

  def new
  end

  def create
    puts params
    kit = User.find(session[:user_id]).kits.new(kit_params)
    if kit.valid?
      kit.save
      redirect_to kit_path Kit.last.id
    else
      flash[:kit_errors] = kit.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @my_kits = User.find(session[:user_id]).kits
    @categories = Category.all
    @kit = Kit.find(params['id'])
    @kit_user = User.find(@kit.user_id)
    @kit_items = Kit.find(params['id']).items
    puts @kit_items
    @item = Kit.find(params["id"]).items.new
  end

  def edit
    @my_kits = User.find(session[:user_id]).kits
    @categories = Category.all
  end

  def update

  end

  def destroy
    Kit.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def kit_params
    params.require(:kit).permit(:title,:category_id, :description)
  end
end
