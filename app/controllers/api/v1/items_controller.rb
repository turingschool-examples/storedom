class Api::V1::ItemsController < Api::V1::BaseController
  respond_to :json, :xml

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      success = {:message => "Congrats! An item was created!", :item => item}
      respond_with(success, :status => 201, :location => item_path(item))
    else
      respond_with({:errors => item.errors }, :status => 422, :location => items_path)
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
