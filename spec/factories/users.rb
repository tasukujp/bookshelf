FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "test_user_#{n}" }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    confirmed_at { Time.current }
  end
end
