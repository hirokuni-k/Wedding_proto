FactoryBot.define do
  factory :user do
    email                 { 'test@exmaple.com' }
    password              { 'abcd1234' }
    password_confirmation { 'abcd1234' }
    nickname              { 'test' }
    last_name             { '田中' }
    first_name            { '太郎' }
    last_name_kana        { 'タナカ' }
    first_name_kana       { 'タロウ' }
    gender_id             { 2 } # 2 = 男性
    birth_date            { '1990-01-01' }
    prefecture_id         { 2 } # 2 = 北海道
  end
end