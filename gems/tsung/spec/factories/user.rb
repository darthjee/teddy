FactoryGirl.define do
  factory :user, class: Tsung::User do
    sequence(:code) { |n| '%04d' % n }
    sequence(:authentication_token) { |n| '%016d' % n }
  end
end
