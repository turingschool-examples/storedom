class CartItemsController < ApplicationController
  before_action :load_cart

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item)
    redirect_to item_path(item)
  end
end
