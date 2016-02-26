class CartItemsController < ApplicationController
  def index
    session[:cart].each do |item_id, qty|
      CartItem.new(Item.find(item_id), qty)
    end

    @cart = session[:cart]
  end

  def create
    session[:cart] ||= Hash.new(0)
    session[:cart][params[:id]] += 1
    redirect_to root_path
  end
end
