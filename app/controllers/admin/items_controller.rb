class Admin::ItemsController < Admin::BaseController
  def create
    @item = Item.new(item_params)
    @item.save
  end
end
