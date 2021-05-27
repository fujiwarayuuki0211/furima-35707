FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials }
    email                  { Faker::Internet.email }
    password               { Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { '山田' }
    first_name             { '太郎' }
    kana_last_name         { 'ヤマダ' }
    kana_first_name        { 'タロウ' }
    birth_date             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
