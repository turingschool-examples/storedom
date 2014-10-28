class OrderGenerator
  def generate(quantity, max_items)
    quantity.times do |i|
      Delay.wait
      user  = User.find(Random.new.rand(1..50))
      order = Order.create!(user_id: user.id)
      add_items(order, max_items)
      puts "Order #{i}: Order for #{user.name} created!"
    end
  end

  def add_items(order, quantity)
    items = Item.all
    (rand(quantity) + 1).times do |i|
      Delay.wait
      item = items.sample
      order.items << item
      puts "#{i}: Added item #{item.name} to order #{order.id}."
    end
  end
end
