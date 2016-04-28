class ItemsController < ApplicationController
  def index
  end

  def new
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
