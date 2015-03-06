class HolesController < ApplicationController
  def one # par 3
    @orders = Order.most_recent
    render 'orders'
  end

  def two # par 4
    item = Item.first
    @users = item.purchasers
    render 'users'
  end

  def three # par 5
    @items = Item.most_popular
    render 'items'
  end

  def four # par 3
    @orders = Order.largest
    render 'orders'
  end
end
