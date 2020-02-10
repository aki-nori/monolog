FactoryBot.define do
  factory :admin do
    name {"admin_test"}
    sequence(:email) { |n| "bot#{n}@example.com"}
    password {"password"}
  end
end
