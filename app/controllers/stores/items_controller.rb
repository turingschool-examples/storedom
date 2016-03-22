class Stores::ItemsController < ApplicationController
  def index
    @store = Store.find_by(slug: params[:store_name])
    @items = @store.items
  end

  def show
  end
end
