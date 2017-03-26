FactoryGirl.define do
  factory :bill do
    active true
    start_date Date.today
    end_date Date.today
    day 10
    user
  end
end
