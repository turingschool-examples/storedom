require_relative '../test_helper'

class ItemTest < ActiveSupport::TestCase
  def test_it_returns_the_most_popular
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

  def test_it_displays_other_users_that_have_purchased
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
end
