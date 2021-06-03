FactoryBot.define do
  factory :item do
    name  { Faker::Name.name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9_999_999) }
    category_id  { Faker::Number.within(range: 2..5) }
    status_id  { Faker::Number.within(range: 2..5) }
    burden_id  { Faker::Number.within(range: 2..5) }
    area_id  { Faker::Number.within(range: 2..5) }
    day_id { Faker::Number.within(range: 2..5) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/star.png'), filename: 'star.png')
    end
  end
end
