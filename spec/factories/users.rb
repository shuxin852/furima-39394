FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.email }
    password { 'aaa111' }
    password_confirmation { password }
    family_name { '山田' }
    last_name { '太郎' }
    family_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birth_day { '1994-02-15' }
  end
end
