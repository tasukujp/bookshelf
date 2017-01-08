FactoryGirl.define do
  factory :user_book do
    transient { date Time.current }
    user { FactoryGirl.create(:user) }
    book { FactoryGirl.create(:book) }
    rental_date { date }
    due_date { date.since(7.days).end_of_day }
  end
end