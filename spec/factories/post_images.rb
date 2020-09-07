FactoryBot.define do
  factory :post_image do
    category_id { Faker::Number.number(digits:1) }
    image_id { "c50512487bd55cee3dc0ea9126694426aa4757ce05cafd842c81b4825310" }
    introduction { Faker::Lorem.characters(number:10) }
  end
end
