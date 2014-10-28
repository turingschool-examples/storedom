class ItemGenerator
  def generate(quantity)
    quantity.times do |i|
      Delay.wait
      item = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/#{i}.png?set=set1&size=200x200"
        )
      puts "Item #{i}: #{item.name} created!"
    end
  end
end
