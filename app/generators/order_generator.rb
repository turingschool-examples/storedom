class OrderGenerator
  include Sidekiq::Worker
  def perform(i, max_items)
    Delay.wait
    user_id = rand(100) + 1
    order = Order.create!(user_id: user_id)
    add_items(order, max_items)
    puts "Order #{i}: Order for User #{user_id} created!"
  end

  def generate(quantity, max_items)
    quantity.times do |i|
      self.class.perform_async(i, max_items)
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
