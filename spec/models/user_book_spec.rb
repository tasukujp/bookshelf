require 'rails_helper'

RSpec.describe UserBook, type: :model do
  it { should belong_to(:user).counter_cache(:books_count) }
  it { should belong_to(:book).counter_cache(:users_count) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:book_id) }
  it { should validate_presence_of(:rental_date) }
  it { should validate_presence_of(:due_date) }
end
