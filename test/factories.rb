FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    image_url Faker::Avatar.image
    description Faker::Lorem.paragraphs(2).join("\n")
  end

  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
  end

  factory :order do
    amount Faker::Commerce.price
    user
  end
end
