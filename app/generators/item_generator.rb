class ItemGenerator
  include Sidekiq::Worker
  def perform(marker)
    Delay.wait
    item = Item.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph,
      image_url: "http://robohash.org/#{marker}.png?set=set1&size=200x200"
      )
    puts "Item #{marker}: #{item.name} created!"
  end

  def generate(quantity)
    quantity.times do |i|
      self.class.perform_async(i)
    end
  end
end
