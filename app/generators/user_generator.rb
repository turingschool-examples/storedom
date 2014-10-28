class UserGenerator
  def generate(quantity)
    quantity.times do |i|
      user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email
        )
      puts "User #{i}: #{user.name} - #{user.email} created!"
    end
  end
end
