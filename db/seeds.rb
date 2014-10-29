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
    users_count.times do |i|
      user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email
        )
      puts "User #{i}: #{user.name} - #{user.email} created!"
    end
  end

  def generate_items
    items_count.times do |i|
      item = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/#{i}.png?set=set1&size=200x200"
        )
      puts "Item #{i}: #{item.name} created!"
    end
  end

  def generate_orders
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
Seed.new(50000,500000,100000)
