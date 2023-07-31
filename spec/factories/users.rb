FactoryBot.define do
  factory :user do
    nick_name              { 'test' }
    email                  { Faker::Internet.email }
    password               { 'nybc12A' }
    password_confirmation  { 'nybc12A' }
    last_name              { '山田' }
    first_name             { '太郎' }
    last_name_kana         { 'ヤマダ' }
    first_name_kana        { 'タロウ' }
    date_birth             { '2010-10-10' }
  end
end
