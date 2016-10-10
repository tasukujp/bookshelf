require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:user).counter_cache(:reviews_count) }
  it { should belong_to(:book).counter_cache(:reviews_count) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:book_id) }
  it { should validate_presence_of(:comment) }
end
