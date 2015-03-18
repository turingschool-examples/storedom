require_relative '../test_helper'

class ActiveRecordGolfTest < ActiveSupport::TestCase
  # hole 1
  def test_it_returns_the_most_recent_orders
    order_1  = Order.create(created_at: 12.days.ago)
    order_2  = Order.create(created_at: 11.days.ago)
    order_3  = Order.create(created_at: 10.days.ago)
    order_4  = Order.create(created_at: 9.days.ago)
    order_5  = Order.create(created_at: 8.days.ago)
    order_6  = Order.create(created_at: 7.days.ago)
    order_7  = Order.create(created_at: 6.days.ago)
    order_8  = Order.create(created_at: 5.days.ago)
    order_9  = Order.create(created_at: 4.days.ago)
    order_10 = Order.create(created_at: 3.days.ago)
    order_11 = Order.create(created_at: 2.days.ago)
    order_12 = Order.create(created_at: 1.days.ago)

    expected = [
      order_12, order_11, order_10, order_9, order_8,
      order_7, order_6, order_5, order_4, order_3
    ]

    # refactor Order.most_recent
    most_recent_orders = Order.most_recent
    assert_equal expected, most_recent_orders

    # You aren't finished until you can uncomment the line below and pass
    # assert most_recent_orders.where(id: order_12.id)
  end

  # hole 2
  def test_it_returns_ordered_items
    skip
    # Get rid of the n+1 query error
    Bullet.start_request
    order_1 = Order.create
    order_2 = Order.create
    ordered_item_1 = order_1.items.create
    ordered_item_2 = order_2.items.create
    unordered_item = Item.create

    ordered_items = Item.ordered

    assert ordered_items.include?(ordered_item_1)
    assert ordered_items.include?(ordered_item_2)
    refute ordered_items.include?(unordered_item)
    Bullet.perform_out_of_channel_notifications if Bullet.notification?
    Bullet.end_request
  end

  # hole 3
  test "it has a polymorphic relationship with users and items" do
    skip
    # this test requires you to setup a polymorphic relationship
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

  # hole 4
  def test_it_returns_the_three_largest_orders
    skip
    order_1 = Order.create
    order_2 = Order.create
    order_3 = Order.create
    order_4 = Order.create
    order_5 = Order.create

    item = Item.create

    order_1.items = [item]
    order_2.items = [item,item]
    order_3.items = [item,item,item,item]
    order_4.items = [item,item,item,item,item]
    order_5.items = [item,item,item]

    expected = [order_4, order_3, order_5]
    assert_equal expected.to_set, Order.largest.to_set
  end

  # hole 5
  def test_it_displays_other_users_that_have_purchased
    skip
    josh = User.create(name:"Josh")
    richard = User.create(name:"Richard")
    sally = User.create(name:"Sally")

    item_1 = Item.create(name: "Item 1")
    item_2 = Item.create(name: "Item 2")

    richard.orders.create(items: [item_1, item_2])
    josh.orders.create(items: [item_2])
    sally.orders.create(items: [item_1])

    assert_equal [sally, richard].to_set, item_1.purchasers.to_set
    assert_equal [josh, richard].to_set, item_2.purchasers.to_set
  end

  # hole 6
  def test_it_returns_the_most_popular
    skip
    popular_1     = Item.create(name: 'popular_1')
    popular_2     = Item.create(name: 'popular_2')
    popular_3     = Item.create(name: 'popular_3')
    not_popular_1 = Item.create(name: 'not_popular_1')
    not_popular_2 = Item.create(name: 'not_popular_2')
    order_1 = Order.create
    order_2 = Order.create

    order_1.items << [popular_1, popular_1, popular_2, popular_3, popular_3]
    order_2.items << [popular_1, popular_1, popular_2, popular_2, not_popular_2]

    expected = [popular_1, popular_2, popular_3].to_set
    assert_equal expected, Item.most_popular.to_set
  end
end

