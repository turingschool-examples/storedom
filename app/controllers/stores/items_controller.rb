class Stores::ItemsController < ApplicationController
  def index
    @store = Store.find_by(name: params[:store_name])
    @items = @store.items
  end

  def show
  end
end
