class Stores::ItemsController < ApplicationController
  def index
    @store = Store.find_by(name: params[:store_name])
  end

  def show
  end
end
