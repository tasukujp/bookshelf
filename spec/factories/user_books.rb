FactoryGirl.define do
  factory :user_book do
    user { FactoryGirl.create(:user) }
    book { FactoryGirl.create(:book) }
    rental_date { Time.current }
    due_date { Time.current.since(7.days).end_of_day }
  end
end