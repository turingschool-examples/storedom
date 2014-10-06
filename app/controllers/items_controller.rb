class ItemsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @items = Item.all

    respond_with @items
  end

  def show
    @item = Item.find(params[:id])

    respond_with @item
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      respond_to do |format|
        format.html { redirect_to :index }
        format.any(:xml, :json) { render request.format.to_sym => { message: "An item was created.", item: @item }, status: 200 }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.any(:xml, :json) { render request.format.to_sym => { errors: @item.errors }, status: 422 }
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update_attributes(item_params)

    if @item.save
      respond_to do |format|
        format.html { redirect_to :show }
        format.any(:xml, :json) { render request.format.to_sym => { message: "The item #{@item.id} was updated.", item: @item }, status: 200 }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.any(:xml, :json) { render request.format.to_sym => { errors: @item.errors }, status: 422 }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
