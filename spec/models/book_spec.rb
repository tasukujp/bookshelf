require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should have_many(:user_books) }
  it { should have_many(:users).through(:user_books) }
  it { should have_many(:reviews) }
  it { should have_many(:review_users).through(:reviews) }

  subject { Book.new(isbn: '978-4797386295', title: 'テスト用タイトル') }

  it { should validate_presence_of(:isbn) }
  it { should validate_uniqueness_of(:isbn).case_insensitive }
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(64) }
  it { should validate_length_of(:author).is_at_most(32) }
  it { should validate_length_of(:publisher).is_at_most(16) }
  it { should allow_value('http://foo.com').for(:url) }
  it { should_not allow_value('foo').for(:url) }
  it { should allow_value('http://foo.com/hoge.jpg').for(:image) }
  it { should_not allow_value('foo').for(:image) }
end
