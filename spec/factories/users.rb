FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { 'ぜんかく' }
    first_name            { 'ぜんかく' }
    family_name_kana      { 'ゼンカク' }
    first_name_kana       { 'ゼンカク' }
    birth_day             { Faker::Date.backward }
  end
end
