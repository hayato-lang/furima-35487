FactoryBot.define do
  factory :order_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '651-0096' }
    prefecture_id { 28 }
    municipality { '神戸市中央区' }
    address { '雲井通7丁目1-1' }
    building_name { 'ミント神戸' }
    phone_number { '0798123456' }
  end
end
