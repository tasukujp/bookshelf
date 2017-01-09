FactoryGirl.define do
  factory :review do
    user { FactoryGirl.create(:user) }
    book { FactoryGirl.create(:book) }
    sequence(:comment) { |n| "Comment#{n}" }
  end
end
