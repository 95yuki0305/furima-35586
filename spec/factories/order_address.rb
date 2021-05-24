FactoryBot.define do
  factory :order_address do
    postal_code       {"123-4567"}
    prefecture        {Prefecture.find(2)}
    municipality      {Faker::Address.city}
    house_number      {Faker::Address.street_address}
    building_name     {Faker::Address.street_name}
    phone_number      {"090-1234-5678"}
    token             {"tok_abcdefghijk00000000000000000"}
    association :product
    association :user
  end
end