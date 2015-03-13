class HolesController < ApplicationController
  before_filter :setup_user_images, only: [:five, :six]

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
    image_1 = Image.where(url: 'https://placekitten.com/g/200/300',
                           imageable_type: 'User',
                           imageable_id: 1).first_or_create
    image_2 = Image.where(url: 'http://placekitten.com/450/300',
                           imageable_type: 'Item',
                           imageable_id: 2).first_or_create

    @images = [image_1, image_2]
    @message = "Here's some kittens."
    render 'images'
  end

  def six # par 3
    # Must complete hole five above first.
    @message = "Here's some robots."

    # Update the line of code below so it doesn't reference the Image class.
    # There's also no need to hit the database again.
    # Update the @user assignment to include the images.
    @images = Image.where(imageable_type: "User", imageable_id: @user.id)
    render 'images'
  end

  private

  def setup_user_images
    @user = User.first
    5.times do |i|
      Image.where(url: "http://robohash.org/#{i}.png?set=set1&size=200x200",
                  imageable_type: "User",
                  imageable_id: @user.id).first_or_create
    end
  end
end
