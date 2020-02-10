FactoryBot.define do
  factory :user do
    name {"user_test"}
    sequence(:email) { |n| "user_test#{n}@example.com"}
    password {"password"}
  end
end
