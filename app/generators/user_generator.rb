class UserGenerator
  include Sidekiq::Worker

  def perform(marker)
    generate_one(marker)
  end

  def generate(quantity)
    quantity.times do |i|
      UserGenerator.perform_async(i)
    end
  end

  def generate_one(marker)
    Delay.wait
    user = User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email
      )
    puts "User #{marker}: #{user.name} - #{user.email} created!"
  end
end
