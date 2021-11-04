FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    city_id       { 2 }
    town          { '大阪市' }
    house_number  { '1-1' }
    building      { '東京ハイツ' }
    tell          { '0000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
