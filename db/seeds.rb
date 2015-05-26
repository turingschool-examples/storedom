class Seed
  def call
    generate_items
    generate_default_user
    generate_users
    generate_orders
  end

  def self.call
    new.call
  end

  private

  def generate_default_user
    # Use build inside of create blocks to set up associations
    User.create(name: "Richard", email: "richard@example.com", password: "asdf") do |user|
      user.orders.build(amount: Faker::Commerce.price) do |order|
        order.items << Item.order("RANDOM()").limit(1).first
      end
    end
  end

  def generate_orders
    100.times do
      user  = User.order("RANDOM()").limit(1).first
      user.orders.create(amount: Faker::Commerce.price) do |order|
        rand(1..10).times do
          order.items << Item.order("RANDOM()").limit(1).first
        end
      end
      puts "Created Orders For: #{user.name}"
    end
  end

  def generate_users
    10.times do
      user  = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "asdf")
      puts "Created User: #{user.name}"
    end
  end

  def generate_items
    1000.times do
      item  = Item.create(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence)
      puts "Created Item: #{item.name}"
    end
  end
end

Seed.call

