FactoryBot.define do
  factory :item do
    name        { 'test' }
    description { 'test' }
    category_id { 2 }
    status_id   { 2 }
    cost_id     { 2 }
    brand_id    { 2 }
    day_id      { 2 }
    price       { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-logo-color.png'), filename: 'furima-logo-corol.png')
    end
  end
end
