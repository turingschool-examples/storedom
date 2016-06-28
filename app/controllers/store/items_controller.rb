class Store::ItemsController < ApplicationController
  def index
    @store = Store.find_by(slug: params[:store_slug])
    @items = @store.items
  end

  def show
  end
end
