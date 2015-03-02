class HolesController < ApplicationController
  def one
    @orders = Order.most_recent
    render 'orders'
  end

  def two
    item = Item.first
    @users = item.purchasers
    render 'users'
  end

  def three
    @items = Item.most_popular
    render 'items'
  end
end
