FactoryBot.define do
  factory :planner do
    email                 { 'test@exmaple.com' }
    password              { 'abcd1234' }
    password_confirmation { 'abcd1234' }
    nickname              { 'test' }
  end
end