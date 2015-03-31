# User 1 with an order
user_1  = User.create(name: "Richard", email: "richard@example.com", password: "asdf")
puts "Created User: #{user_1.name}"

item_1  = Item.create(name: "Bicycle", description: "This is a description.")
puts "Created Item: #{item_1.name}"

order_1 = Order.create(amount: 10.00, user_id: user_1.id)
order_1.items << item_1
puts "Created Order For: #{order_1.user.name}"

# User 1 with an order
user_2  = User.create(name: "Ritchie Valens", email: "ritchie@example.com", password: "asdf")
puts "Created User: #{user_2.name}"

item_2  = Item.create(name: "Guitar", description: "Oh Donna.")
puts "Created Item: #{item_2.name}"

order_2 = user_2.orders.create(amount: 10.00)
order_2.items << item_2
puts "Created Order For: #{order_2.user.name}"

