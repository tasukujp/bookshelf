require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many(:user_books) }
    it { is_expected.to have_many(:users).through(:user_books) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:review_users).through(:reviews) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:isbn) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:isbn).case_insensitive }

    it { is_expected.to validate_length_of(:title).is_at_most(64) }
    it { is_expected.to validate_length_of(:author).is_at_most(32) }
    it { is_expected.to validate_length_of(:publisher).is_at_most(16) }

    it { is_expected.to allow_value('978-4797386295').for(:isbn) }
    it { is_expected.not_to allow_value('foo').for(:isbn) }
    it { is_expected.to allow_value('http://foo.com').for(:url) }
    it { is_expected.not_to allow_value('foo').for(:url) }
    it { is_expected.to allow_value('http://foo.com/hoge.jpg').for(:image) }
    it { is_expected.not_to allow_value('foo').for(:image) }
  end

  describe '#rental?' do
    context 'user_booksテーブルにレコードが0件の場合' do
      let(:book) { create(:book) }
      it { expect(book.rental?(build(:user))).to eq false }
    end
    context 'user_booksテーブルに未返却のレコードが存在する場合' do
      let(:user_book) { create(:user_book) }
      it { expect(user_book.book.rental?(user_book.user)).to eq true }
    end
  end
end
