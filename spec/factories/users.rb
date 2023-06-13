FactoryBot.define do
  factory :user do
    nickname {'test'}
    emai {'test@test'}
    password {'aaa000'}
    password_confirmation {password}
    family_name {'山田'}
    last_name {'太郎'}
    family_name_kana {'ヤマだ'}
    last_name_kana {'タロウ'}
    birth_day {'1994-02-15'}
  end
end