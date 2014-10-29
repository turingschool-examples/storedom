class ItemsController < ApplicationController
  def index
    @items = Item.first(50)
  end

  def show
    @item = Item.find(params[:id].to_i)
  end
end