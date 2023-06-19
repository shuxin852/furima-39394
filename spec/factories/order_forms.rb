FactoryBot.define do
  factory :order_form do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { 'test' }
    address { Faker::Lorem.sentence }
    building_name { Faker::Lorem.sentence }
    phone_number { '12312341234' }
  end
end
