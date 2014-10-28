user_generator = UserGenerator.new
user_generator.generate(100)

item_generator = ItemGenerator.new
item_generator.generate(500)

order_generator = OrderGenerator.new
order_generator.generate(100, 6)
