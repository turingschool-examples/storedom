class StoresController < ApplicationController

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find_by(slug: params[:store])
  end
end
