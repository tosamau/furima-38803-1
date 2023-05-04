FactoryBot.define do
  factory :item do
    item_name          {Faker::Lorem.sentence}
    description        {Faker::Lorem.sentence}
    category_id        {'11'}
    condition_id       {'3'}
    shipping_fee_id    {'3'}
    ship_from_id       {'4'}
    shipping_day_id    {'3'}
    price              {'2000'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
