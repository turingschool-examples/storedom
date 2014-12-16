User.destroy_all
user_generator = UserGenerator.new
user_generator.generate(100)

Item.destroy_all
item_generator = ItemGenerator.new
item_generator.generate(500)

Order.destroy_all
order_generator = OrderGenerator.new
order_generator.generate(100, 6)
