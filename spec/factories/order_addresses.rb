FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    ship_from_id { 34 }
    city_name { '岡山市北区' }
    house_number { '1-1-1' }
    building_name { '第２ビル' }
    phone_number { '09012345678' }
  end
end
