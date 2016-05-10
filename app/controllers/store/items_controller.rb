class Store::ItemsController < ApplicationController
  def index
    @store = Store.find_by(slug: params[:store])
    @items = @store.items
  end

  def show
    @store = Store.find_by(slug: params[:store])
    @item = @store.items.find_by(id: params[:id])
    render file: "/public/404" if @item.nil?
  end
end
