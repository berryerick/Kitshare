class ItemsController < ApplicationController
  require 'json'
  require 'net/http'
  require 'open-uri'



  def index
  end

  def new

    @my_kits = User.find(session[:user_id]).kits
    @user = User.find(session[:user_id])
    @categories = Category.all


    if params[:search]
      $search_uri = "https://www.googleapis.com/customsearch/v1?key=AIzaSyDASpjStx7MP6bUQQ5HmOHOIDAoClhbMOY&cx=011183661521492978959:ggtulncvsyy&q=" + params[:search][:item]

      uri = URI.parse($search_uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      data = response.body
      @results = JSON.load(data)["items"][0..8]
      # render json: @results
    end

  end

  def create
    puts params
    @item = Kit.find(params[:item]["kit_id"]).items.new(item_params)
    if @item.save
      Kit.find(params[:item]["kit_id"]).kit_items.create(item: Item.last )
      # KitItem.new(kit_id: )
    else
      flash[:item_errors] = @item.errors.full_messages
    end
    redirect_to :back

  end

  def show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    Item.find(params[:id]).update(item_params)
    redirect_to kits_path
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to :back
  end







  private



  def item_params
    params.require(:item).permit(:item_name, :item_img, :description)

  end
end
