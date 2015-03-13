require_relative '../test_helper'

class OrderTest < ActiveSupport::TestCase
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

    assert_equal expected, Order.most_recent
  end

  def test_it_returns_the_three_largest_orders
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
end
