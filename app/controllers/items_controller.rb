class ItemsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @items = Item.all
    respond_with @items
  end

  def show
    @item = Item.find(params[:id].to_i)
    respond_with @item
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      respond_with do |format|
        format.html { redirect_to :show }
        format.json { render :json => {:message => "Congrats! An item was created!", :item => @item }, :status => 201 }
        format.xml { render :xml => {:message => "Congrats! An item was created!", :item => @item }, :status => 201 }
      end
    else
      respond_with do |format|
        format.html { render :new }
        format.json { render :json => {:errors => @item.errors }, :status => 422 }
        format.xml { render :xml => {:errors => @item.errors }, :status => 422 }
      end
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end