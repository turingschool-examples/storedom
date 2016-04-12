class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    @items = Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end



end
