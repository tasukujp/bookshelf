FactoryGirl.define do
  factory :book do
    sequence(:isbn) { |n| "978-479738629#{n}" }
    title { Faker::Book.title }
  end
end
