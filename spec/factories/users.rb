FactoryBot.define do
  factory :user do
    nick_name           { 'test' }
    email               { 'test@example.com' }
    password            { 'nybc12A' }
    encrypted_password  { 'nybc12A' }
    first_name          { 'やまだ' }
    last_name           { 'たろう' }
    katagana_first_name { 'ヤマダ' }
    katagana_last_name  { 'タロウ' }
    date_of_birth       { '2010-10-10' }
  end
end
