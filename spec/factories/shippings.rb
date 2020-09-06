FactoryBot.define do
  factory :shipping do
    postal_code { Faker::Number.number(digits:7) }
    prefecture_code { Faker::Lorem.characters(number:4) }
    address_city { Faker::Lorem.characters(number:4) }
    address_street { Faker::Lorem.characters(number:4) }
    address_building { Faker::Lorem.characters(number:4) }
    receiver { Faker::Lorem.characters(number:4) }
    phone_number { Faker::Number.number(digits:10) }
  end
end
