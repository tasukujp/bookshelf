FactoryGirl.define do
  factory :book do
    isbn '978-4797386295'
    title { Faker::Book.title }
  end
end