FactoryBot.define do
  factory :product do
    name                 {Faker::Commerce.product_name}
    description          {Faker::Lorem.sentence}
    category_id          { 2 }
    status_id            { 2 }
    shinpping_charge_id  { 2 }
    prefecture_id        { 2 }
    days_to_ship_id      { 2 }
    selling_price        {Faker::Number.number(digits: 4)}
    association :user
  end
end
