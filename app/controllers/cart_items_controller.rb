class CartItemsController < ApplicationController
  before_action :load_cart

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item)
    session[:cart] = @cart.data
    flash[:notice] = "You have #{pluralize(@cart.count_of(item), item.name)} in your cart."
    redirect_to item_path(item)
  end
end
