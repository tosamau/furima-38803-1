FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + "1a" }
    password_confirmation { password }
    nickname              { Faker::Name.initials(number: 2) }
    family_name           { '鈴木' }
    last_name             { '一郎' }
    family_name_kana      { 'スズキ' }
    last_name_kana        { 'イチロウ' }
    birth                 { '1930-01-01' }
  end
end
