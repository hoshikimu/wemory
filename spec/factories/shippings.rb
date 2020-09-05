FactoryBot.define do
  factory :shipping do
    postal_code { Faker::Lorem.characters(number:7) }
    prefecture_code { Faker::Lorem.characters(number:4) }
    address_city { Faker::Lorem.characters(number:4) }
    address_street { Faker::Lorem.characters(number:4) }
    address_building { Faker::Lorem.characters(number:4) }
    receiver { Faker::Lorem.characters(number:4) }
    phone_number { Faker::Lorem.characters(number:10) }
  end
end
