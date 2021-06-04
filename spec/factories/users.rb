FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'abc@abc.com' }
    password              { '123abc' }
    password_confirmation { '123abc' }
    family_name           { 'ぜんかく' }
    first_name            { 'ぜんかく' }
    family_name_kana      { 'ゼンカク' }
    first_name_kana       { 'ゼンカク' }
    birth_day             { '2001-01-01' }
  end
end
