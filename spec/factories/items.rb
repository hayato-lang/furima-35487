FactoryBot.define do
  factory :item do
    name  { 'ゴーゴーカレー' }
    description { 'とっても美味しいカレーで関東では大好評！！黒いカレーがあなたの心を鷲掴み！' }
    category_id { 7 }
    status_id { 4 }
    fee_id { 2 }
    prefecture_id   { 25 }
    shipping_day_id { 2 }
    price { '5000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
