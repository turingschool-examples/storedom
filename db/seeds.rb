require "populator"

class Seed
  BATCH_SIZE = 100
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
    (users_count/BATCH_SIZE).times do
      User.populate(BATCH_SIZE) do |user|
        user.name = Faker::Name.name
        user.email = Faker::Internet.email
        puts "User: #{user.name} - #{user.email} created!"
      end
    end
  end

  def generate_items
    (items_count/BATCH_SIZE).times do
      Item.populate(BATCH_SIZE) do |item|
        item.name = Faker::Commerce.product_name
        item.description = Faker::Lorem.paragraph
        item.image_url = Faker::Avatar.image
        puts "Item: #{item.name} created!"
      end
    end
  end

  def generate_orders
    raise "stop before orders"
    orders_count.times do |i|
      user  = User.find(Random.new.rand(1..users_count))
      order = Order.create!(user_id: user.id)
      add_items(order)
      puts "Order #{i}: Order for #{user.name} created!"
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
Seed.new(10000,500000,100000)
