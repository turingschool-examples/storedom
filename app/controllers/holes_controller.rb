class HolesController < ApplicationController
  def one # par 3
    @orders = Order.most_recent
    render 'orders'
  end

  def two # par 4
    item = Item.first
    @users = item.purchasers
    render 'users'
  end

  def three # par 5
    @items = Item.most_popular
    render 'items'
  end

  def four # par 3
    @orders = Order.largest
    render 'orders'
  end

  def five # par 4
    # 1. Make the test located in /test/models/image_test.rb pass.
    #    (Hint: The database will need to be updated and it's polymorphic.)
    #
    # 2. If everything is good, you should be rewarded when
    #    you visit /holes/five
    @image_1 = Image.where(url: 'https://placekitten.com/g/200/300',
                           imageable_type: 'User',
                           imageable_id: 1).first_or_create
    @image_2 = Image.where(url: 'http://placekitten.com/450/300'
                           imageable_type: 'Item',
                           imageable_id: 2).first_or_create
                          ).first_or_create
    render 'images'
  end
end
