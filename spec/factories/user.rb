FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_user_#{n}@example.com" }
    password { 'password_1234' }
    sequence(:name) { |n| "test_user_#{n}" }
  end
end
