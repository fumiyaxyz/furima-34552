FactoryBot.define do
  factory :item do
    name  {Faker::Name.name}
    description {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    price {Faker::Number.between(from:300,to:9999999)}
    category_id {Faker::Number.between(from:2,to:11)}
    status_id {Faker::Number.between(from:2,to:7)}
    delivery_fee_id {Faker::Number.between(from:2,to:3)}
    prefecture_id {Faker::Number.between(from:2,to:48)}
    ship_days_id {Faker::Number.between(from:2,to:4)}
    association :user 
  end
end
