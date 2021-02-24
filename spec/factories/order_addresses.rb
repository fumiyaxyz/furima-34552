FactoryBot.define do
  factory :order_address do
    postal_code { "333-6783" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_number { Faker::Address.building_number }
    phone_number {"08038383838"}
  end
end
