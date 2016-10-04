class Api::V1::ItemsController < Api::BaseController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end

  def update
    render json: Item.update(params[:id], item_params)
  end

  def destroy
    render json: Item.destroy(params[:id])
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
