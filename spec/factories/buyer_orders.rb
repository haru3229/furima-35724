FactoryBot.define do
  factory :buyer_order do
    postal_code   { '123-4567' }
    brand_id      { 2 }
    city          { '渋谷区渋谷' }
    address       { '1-1-1' }
    building      { '渋谷ハイツ' }
    phone_number  { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
