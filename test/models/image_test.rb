require_relative '../test_helper'

class ImageTest < ActiveSupport::TestCase
  test "it has a polymorphic relationship with users and items" do
    skip
    user = User.create(name: "Richard")
    item = Item.create(name: "Blunderbuss")

    # This assumes a user has_many images
    image_1 = user.images.create(url: "http://placekitten.com/450/300")

    # This assumes an item has_many images
    image_2 = item.images.create(url: "https://placekitten.com/g/200/300")

    assert_equal "User", image_1.imageable_type
    assert_equal user.id, image_1.imageable_id

    assert_equal "Item", image_2.imageable_type
    assert_equal item.id, image_2.imageable_id
  end
end

