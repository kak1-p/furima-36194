FactoryBot.define do
  factory :item do
    items_name  {Faker::Lorem.sentence}
    detail      {Faker::Lorem.sentence}
    category_id {'2'}
    status_id   {'2'}
    fee_id      {'2'}
    city_id     {'2'}
    delivery_date_id  {'2'}
    price       {'555'}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
