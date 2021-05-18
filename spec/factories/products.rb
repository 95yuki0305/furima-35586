FactoryBot.define do
  factory :product do
    name                 {Faker::Commerce.product_name}
    description          {Faker::Lorem.sentence}
    category             {Category.find(2)}
    status               {Status.find(2)}
    shinpping_charge     {ShinppingCharge.find(2)}
    prefecture           {Prefecture.find(2)}
    days_to_ship         {DaysToShip.find(2)}
    selling_price        {Faker::Number.number(digits: 4)}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end