class Stores::ItemsController < ApplicationController
  def index
    @store = Store.find_by(slug: params[:slug])
  end
end
