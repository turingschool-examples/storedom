class ItemsController < ApplicationController

  def index
    @items = Rails.cache.fetch("all-items", expires_at: Date.tomorrow) do
      Item.all
    end

  end

  def show
    @item = Item.find(params[:id].to_i)
  end
end
