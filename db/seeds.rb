require "populator"

class Seed
  attr_reader :users_count, :items_count, :orders_count

  def initialize(users_count = 50, items_count = 500, orders_count = 100)
    @users_count = users_count
    @items_count = items_count
    @orders_count = orders_count
    generate_users
    generate_items
    generate_orders
  end

  def generate_users
    User.populate(users_count) do |user|
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      puts "User: #{user.name} - #{user.email} created!"
    end
  end

  def generate_items
    Item.populate(items_count) do |item|
      item.name = Faker::Commerce.product_name
      item.description = Faker::Lorem.paragraph
      item.image_url = Faker::Avatar.image
      puts "Item #{item.id}: #{item.name} created!"
    end
  end

  def generate_orders
    number_of_users = User.count
    number_of_items = Item.count
    Order.populate(orders_count) do |order|
      order.user_id = rand(1..number_of_users)
      order.amount = Faker::Commerce.price
      OrderItem.populate(rand(1..10)) do |item|
        item.order_id = order.id
        item.item_id = rand(1..number_of_items)
      end
      puts "Order #{order.id} created"
    end
  end

  private

  def add_items(order)
    rand(20).times do |i|
      item = Item.find(Random.new.rand(1..items_count))
      order.items << item
      puts "#{i}: Added item #{item.name} to order #{order.id}."
    end
  end
end

SmallTable.destroy_all
10.times do
  SmallTable.create(:some_data => Faker::Lorem.sentences.first, :some_more_data => Faker::Lorem.sentences.first)
end

#Seed.new
Seed.new(1000,10,3000)
