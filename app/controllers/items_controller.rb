class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id].to_i)
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end