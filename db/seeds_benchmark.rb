require 'benchmark'

User.destroy_all
Item.destroy_all
Order.destroy_all

Rails.application.load_seed

puts Benchmark.measure {
  user_target = 100
  item_target = 500
  order_target = 100
  complete = false

  until complete
    user_count = User.count
    item_count = Item.count
    order_count = Order.count

    if user_target == user_count &&
      item_target == item_count &&
      order_target == order_count

      complete = true
    else
      sleep 0.25
      puts "Counts: #{user_count} users, #{item_count} items, #{order_count} orders"
    end
  end
}
