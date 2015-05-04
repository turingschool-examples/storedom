class ItemsController < ApplicationController
  def new
    sleep(1)
    render text: "hi there friends"
  end

  def index
    #expires_in 5.seconds, :public => true
    #fresh_when(:last_modified => Item.maximum(:updated_at))
  end

  def show
    @item = Item.find(params[:id].to_i)
    #http://rtomayko.github.io/rack-cache/
    #expires_in 10.seconds, :public => true
    #fresh_when(@item)
  end

  def items
    @items ||= Item.all
  end
  helper_method :items
end