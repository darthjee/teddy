FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@server.com" }
    password "12345678"
  end
end
