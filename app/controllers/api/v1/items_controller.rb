class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all, each_serializer: ShortItemSerializer
  end

  def show
    respond_with Item.find(params[:id]), serializer: CompleteItemSerializer
  end
end
