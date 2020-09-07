FactoryBot.define do
  factory :contact do
    email { Faker::Internet.email }
    message { Faker::Lorem.characters }
  end
end
