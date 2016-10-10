require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_books) }
  it { should have_many(:books).through(:user_books) }
  it { should have_many(:reviews) }
  it { should have_many(:review_books).through(:reviews) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(4) }
  it { should validate_length_of(:name).is_at_most(16) }
end
