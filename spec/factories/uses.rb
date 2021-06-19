FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email  {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    first_name            {'かつお'}
    last_name             {'磯野'}
    first_name_kana       {'カツオ'}
    last_name_kana        {'イソノ'}
    birthday              {'1990-01-12'}
  end
end